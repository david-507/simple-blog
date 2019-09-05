package org.dmace.hbn.simpleblog.model.bean;

public class RegisterBean {

    private String email;
    private String name;
    private String city;
    private String password;
    private String passwordRepeat;

    public RegisterBean() {
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getCity() {
        return city;
    }

    public String getPassword() {
        return password;
    }

    public String getPasswordRepeat() {
        return passwordRepeat;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPasswordRepeat(String passwordRepeat) {
        this.passwordRepeat = passwordRepeat;
    }
}
