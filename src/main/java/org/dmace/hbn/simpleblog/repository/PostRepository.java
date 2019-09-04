package org.dmace.hbn.simpleblog.repository;

import org.dmace.hbn.simpleblog.model.Item;
import org.springframework.data.repository.CrudRepository;

/** Post repository layer with basic CRUD operations */
public interface PostRepository extends CrudRepository<Item, Long> {
}
