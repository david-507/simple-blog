package org.dmace.hbn.simpleblog.repository;

import org.dmace.hbn.simpleblog.model.Item;
import org.dmace.hbn.simpleblog.model.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@DataJpaTest
public class UserRepositoryTest {

    @Autowired
    private UserRepository repository;

    @Before
    public void deleteUsers() {
        repository.deleteAll();
    }

    @Test
    public void whenSave_thenCorrectNumberOfUsers() {
        User user = new User("me", "Vancouver", new Date());
        repository.save(user);
        List<User> users = (List<User>) repository.findAll();

        Assert.assertEquals(1, users.size());

        repository.delete(user);
        users = (List<User>) repository.findAll();
        Assert.assertEquals(0, users.size());
    }

    @Ignore
    public void whenSaveWithoutDate_thenDateIsCreated() {
        User u = new User();
        u.setEmail("hello@gmail.com");
        u.setCity("New York");
        u.setName("test");

        repository.save(u);

        u = repository.findByEmail("hello@gmail.com");
        Assert.assertNotNull(u.getCreated());
    }

}
