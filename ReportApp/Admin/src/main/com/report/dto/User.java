package main.com.report.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by alex1_000 on 20.11.2016.
 */
public class User implements Serializable {

    private long id;

    private String name;

    private String surname;

    private String email;

    private int payCounter;

    private String password;

    private Date dateBirth;

    private String authority;

    private List<Object> orders =new ArrayList<Object>();

    private Object userAddress;

    public User(){
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

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDateBirth() {
        return dateBirth;
    }

    public void setDateBirth(Date dateBirth) {
        this.dateBirth = dateBirth;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public List<Object> getOrders() {
        return orders;
    }

    public void setOrders(List<Object> orders) {
        this.orders = orders;
    }

    public Object getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(Object userAddress) {
        this.userAddress = userAddress;
    }

    public int getPayCounter() {
        return payCounter;
    }

    public void setPayCounter(int payCounter) {
        this.payCounter = payCounter;
    }
}
