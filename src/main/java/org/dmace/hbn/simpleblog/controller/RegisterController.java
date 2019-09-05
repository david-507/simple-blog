package org.dmace.hbn.simpleblog.controller;

import org.dmace.hbn.simpleblog.model.bean.RegisterBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController {

    @GetMapping("/signup")
    public String register(Model model){
        model.addAttribute("register", new RegisterBean());
        return "register";
    }

    @PostMapping("/signup")
    public String doregister(@ModelAttribute("register") RegisterBean rb, BindingResult br, Model model) {
        //TODO: create new user
        model.addAttribute("register", rb);
        return "register";
    }

}
