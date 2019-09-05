package org.dmace.hbn.simpleblog.controller;

import org.dmace.hbn.simpleblog.model.User;
import org.dmace.hbn.simpleblog.model.bean.RegisterBean;
import org.dmace.hbn.simpleblog.service.RegisterService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class RegisterController {
    private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);

    @Autowired
    private RegisterService service;

    @Autowired
    private HttpSession session;

    @GetMapping("/signup")
    public String register(@ModelAttribute("rb") RegisterBean rb){
        return "register";
    }

    @PostMapping("/signup")
    public String doRegister(@Valid @ModelAttribute("rb") RegisterBean rb, BindingResult br) {
        String result = "register";
        if(br.hasErrors()){
            logger.info("Binding result has errors");
        } else {
            User user = service.register(rb);
            session.setAttribute("user", user);
            result = "redirect:/";
        }
        return result;
    }

}
