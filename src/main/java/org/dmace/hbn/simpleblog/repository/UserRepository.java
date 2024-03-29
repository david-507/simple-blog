package org.dmace.hbn.simpleblog.repository;

import org.dmace.hbn.simpleblog.model.User;
import org.springframework.data.repository.CrudRepository;

/** User repository layer with basic CRUD operations */
public interface UserRepository extends CrudRepository<User, Long> {

    User findByEmail(String email);
}
