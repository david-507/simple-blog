package org.dmace.hbn.simpleblog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class SimpleBlogApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(SimpleBlogApplication.class, args);
    }

}
