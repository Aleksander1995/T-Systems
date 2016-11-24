package com.mystore.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "orders")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "payment_method")
    private String paymentMethod;

    @Column(name = "delivery_method")
    private String deliveryMethod;

    @Column(name = "payment_status")
    private String paymentStatus;

    @Column(name = "order_status")
    private String orderStatus;

    @Column(name = "amount")
    private int amount;

    @ManyToOne
    @JoinColumn(name = "id_product")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;

    public Order(){
    }

    public long getId() {
        return id;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public String getDeliveryMethod() {
        return deliveryMethod;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public int getAmount() {
        return amount;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public void setDeliveryMethod(String deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}