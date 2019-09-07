package org.dmace.hbn.simpleblog.controller.user;

import org.dmace.hbn.simpleblog.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


// Should only be accessed by admin
@Controller()
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository repository;

    // TODO: check user is present
    @GetMapping("/list")
    public String list(ModelMap model) {
        model.addAttribute("users", repository.findAll());
        return "user/list";
    }

}
