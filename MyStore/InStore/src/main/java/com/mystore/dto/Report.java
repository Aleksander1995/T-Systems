package com.mystore.dto;

import com.mystore.domain.Product;
import com.mystore.domain.User;
import java.io.Serializable;
import java.util.List;

public class Report implements Serializable{
    public Report(){}


    private List<User> user;
    private List<Product> product;

    public List<Product> getProduct() {
        return product;
    }

    public void setProduct(List<Product> product) {
        this.product = product;
    }

    public List<User> getUser() {
        return user;
    }

    public void setUser(List<User> user) {
        this.user = user;
    }
}
