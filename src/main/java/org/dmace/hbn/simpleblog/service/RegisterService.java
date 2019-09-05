package org.dmace.hbn.simpleblog.service;

import org.dmace.hbn.simpleblog.model.User;
import org.dmace.hbn.simpleblog.model.bean.RegisterBean;
import org.dmace.hbn.simpleblog.repository.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class RegisterService {

    @Autowired
    private UserRepository repository;

    @Transactional
    public User register(RegisterBean rb) {
        User user = toUser(rb);
        return repository.save(user);
    }

    /** Creates a new User instance with the given Bean values */
    private User toUser(RegisterBean rb) {
        return new User(rb.getName(), rb.getEmail(), rb.getCity(), BCrypt.hashpw(rb.getPassword(), BCrypt.gensalt()));
    }

}
