package org.dmace.hbn.simpleblog.repository;

import org.dmace.hbn.simpleblog.model.Item;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@DataJpaTest
public class ItemRepositoryTest {

    @Autowired
    private ItemRepository repository;

    @Test
    public void whenSave_thenCorrectNumberOfUsers() {

        repository.save( new Item("David", "david@gmail.com"));
        List<Item> items = (List<Item>) repository.findAll();

        Assert.assertEquals(1, items.size());
    }

}
