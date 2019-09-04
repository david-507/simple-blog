package org.dmace.hbn.simpleblog.model.bean;

import org.junit.Assert;
import org.junit.Test;
import org.mindrot.jbcrypt.BCrypt;


public class LoginBeanTest {

    @Test
    public void passwords_shouldBeEncrypted() {
        String plainTextPassword = "s3cret";
        String hashedPassword = BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
        LoginBean lb = new LoginBean("test@localhost.com", plainTextPassword);

        Assert.assertTrue(BCrypt.checkpw(lb.getPassword(), hashedPassword));
    }

}
