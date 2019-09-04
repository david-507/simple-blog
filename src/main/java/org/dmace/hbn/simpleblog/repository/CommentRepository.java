package org.dmace.hbn.simpleblog.repository;

import org.dmace.hbn.simpleblog.model.Item;
import org.springframework.data.repository.CrudRepository;

/** Comment repository layer with basic CRUD operations */
public interface CommentRepository extends CrudRepository<Item, Long> {
}
