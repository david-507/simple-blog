package org.dmace.hbn.simpleblog;

import org.dmace.hbn.simpleblog.service.StorageService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SimpleBlogApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(SimpleBlogApplication.class, args);
    }

    /**
     * Bean created application startup. Initializes storage.
     *
     * @param storageService StorageService
     */
    @Bean
    CommandLineRunner init(StorageService storageService) {
        return (args) -> {
            //storageService.deleteAll();
            storageService.init();
        };
    }
}
