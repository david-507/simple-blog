package org.dmace.hbn.simpleblog.repository;

import org.dmace.hbn.simpleblog.model.Item;
import org.springframework.data.repository.CrudRepository;

/**
 * Basic repository layer with CRUD operations
 *
 */
public interface ItemRepository extends CrudRepository<Item, Long> {
}
