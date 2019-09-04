package org.dmace.hbn.simpleblog.model;

import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    private String name;

    private String city;

    @CreatedDate
    private Date created;

    @OneToMany( mappedBy = "owner", cascade = CascadeType.ALL, orphanRemoval = true )
    private List<Post> posts;


    public User() {
        this.posts = new ArrayList<>();
    }

    public User(String name, String city, Date created) {
        this.name = name;
        this.city = city;
        this.created = created;
        this.posts = new ArrayList<>();
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCity() {
        return city;
    }

    public Date getCreated() {
        return created;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setCreated(Date created) {
        this.created = created;
    }
}
