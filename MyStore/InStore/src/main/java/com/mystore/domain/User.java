package com.mystore.domain;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "user")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;

    @Size(max = 45)
    @Column(name = "name")
    private String name;

    @Size(max = 45)
    @Column(name = "surname")
    private String surname;

    @Email(message = "Email определен в неверном формате")
    @NotEmpty
    @Size(max = 45)
    @Column(name = "email")
    private String email;


    @Size(min = 1, max = 100)
    @Column(name = "password")
    private String password;

    @Past(message = "Некорректно введенные данные")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Column(name = "datebirth")
    private Date dateBirth;

    @Size(min = 1, max = 45)
    @Column(name = "authority")
    private String authority;

    @OneToMany (cascade = {CascadeType.ALL},mappedBy = "user")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Order> orders =new ArrayList<Order>();

    @Valid
    @OneToOne(cascade = {CascadeType.ALL}, mappedBy = "user",fetch = FetchType.LAZY)
    private UserAddress userAddress;

    @Column(name = "pay_counter")
    private int payCounter;

    public User(){
    }

    public User(String name, String surname, String email, int payCounter) {
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.payCounter=payCounter;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public UserAddress getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(UserAddress userAddress) {
        this.userAddress = userAddress;
    }

    public int getPayCounter() {
        return payCounter;
    }

    public void setPayCounter(int payCounter) {
        this.payCounter = payCounter;
    }

    @Override
    public String toString() {
        return String.format("{name:%s,surname:%s,email:%s}", getName(), getSurname(), getEmail());
    }
}
