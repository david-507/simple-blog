package org.dmace.hbn.simpleblog.controller;

import org.dmace.hbn.simpleblog.exceptions.StorageException;
import org.dmace.hbn.simpleblog.model.User;
import org.dmace.hbn.simpleblog.model.bean.RegisterBean;
import org.dmace.hbn.simpleblog.service.RegisterService;
import org.dmace.hbn.simpleblog.service.StorageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class RegisterController {
    private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

    @Autowired
    private RegisterService registerService;

    @Autowired
    private HttpSession session;

    @Autowired
    private StorageService storageService;

    @GetMapping("/signup")
    public String register(@ModelAttribute("rb") RegisterBean rb){
        return "register";
    }

    @PostMapping("/signup")
    public String doRegister(@Valid @ModelAttribute("rb") RegisterBean rb, BindingResult br,
                             @RequestParam("file") MultipartFile file) {
        String result = "register";
        if(br.hasErrors()){
            logger.info("Binding result has errors");
        } else {
            User user = null;
            try {
                if(!file.isEmpty()) // add avatar url to user
                    rb.setImg(storageService.generateUrlFor(file, rb.getEmail()));

                // create user
                user = registerService.register(rb);

                // user has been saved to DB. Store the file
                if(!file.isEmpty()) {
                    storageService.store(file, rb.getEmail());
                }
                session.setAttribute("user", user);
                result = "redirect:/";
            } catch (DataIntegrityViolationException e) {
                logger.warn("Oups.. trying to add a new user with an existing email ({}) ?", rb.getEmail());
                logger.warn(e.getMessage());
                br.addError(new FieldError("rb", "email", "Sorry, email \"" + rb.getEmail() + "\" is already taken"));
            } catch (StorageException se) {
                logger.error("avatar for user {} could not be saved!", rb.getEmail());
                if(user!=null)// delete avatar url from DB
                    registerService.deleteAvatar(user);
            }
        }
        return result;
    }


}
