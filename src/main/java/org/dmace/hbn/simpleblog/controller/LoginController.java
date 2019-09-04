package org.dmace.hbn.simpleblog.controller;

import org.dmace.hbn.simpleblog.model.User;
import org.dmace.hbn.simpleblog.model.bean.LoginBean;
import org.dmace.hbn.simpleblog.repository.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class LoginController {

    @Autowired
    UserDAO repository;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("userLogin", new LoginBean());
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(@ModelAttribute("userLogin") LoginBean bean, BindingResult result, Model model) {
        List<User> users = repository.getAll();
        model.addAttribute("userLogin", new LoginBean());
        model.addAttribute("message", "testing...");
        model.addAttribute("totalUsers", users.size());
        return "login";
    }
}