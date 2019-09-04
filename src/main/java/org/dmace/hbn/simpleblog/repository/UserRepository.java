package org.dmace.hbn.simpleblog.repository;

import org.dmace.hbn.simpleblog.model.Item;
import org.springframework.data.repository.CrudRepository;

/** User repository layer with basic CRUD operations */
public interface UserRepository extends CrudRepository<Item, Long> {
}
