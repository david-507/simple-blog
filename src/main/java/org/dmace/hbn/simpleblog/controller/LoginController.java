package org.dmace.hbn.simpleblog.controller;

import org.dmace.hbn.simpleblog.model.User;
import org.dmace.hbn.simpleblog.model.bean.LoginBean;
import org.dmace.hbn.simpleblog.repository.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    UserRepository repository;

    @Autowired
    HttpSession session;

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("userLogin", new LoginBean());
        return "login";
    }

    @PostMapping("/login")
    public String doLogin(@ModelAttribute("userLogin") LoginBean lb, BindingResult br, Model model) {
        String result = "redirect:/";
        User user = repository.findByEmail(lb.getEmail());

        if( loginSuccess(lb, user) ) {
            session.setAttribute("user", user);
        } else {
            model.addAttribute("userLogin", lb);
            model.addAttribute("error", "email or password incorrect");
            result = "/login";
        }

        return result;
    }

    @GetMapping("/logout")
    public String doLogout() {
        if(session!=null) {
            session.removeAttribute("user");
            session.invalidate();
        }
        return "redirect:/";
    }

    private boolean loginSuccess(LoginBean lb, User user) {
        return user != null && BCrypt.checkpw(lb.getPassword(), user.getPassword());
    }
}