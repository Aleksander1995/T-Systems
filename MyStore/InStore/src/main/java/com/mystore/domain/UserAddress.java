package com.mystore.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "user_address")
public class UserAddress implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;

    @Size(max = 45)
    @Column(name = "country")
    private String country;

    @Size(max = 45)
    @Column(name = "city")
    private String city;

    @Size(max = 45)
    @Column(name = "postal_code")
    private String postalCode;

    @Size(max = 45)
    @Column(name = "street")
    private String street;

    @Size(max = 45)
    @Column(name = "home")
    private String home;

    @Size(max = 45)
    @Column(name = "flat")
    private String flat;


    @OneToOne
    @JoinColumn(name = "id_user")
    private User user;

    public UserAddress(){
    }

    public long getId_address() {
        return id;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public String getStreet() {
        return street;
    }

    public String getHome() {
        return home;
    }

    public String getFlat() {
        return flat;
    }

    public User getUser() {
        return user;
    }

    public void setId(long id_address) {
        this.id = id_address;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public void setFlat(String flat) {
        this.flat = flat;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
