package com.mystore.domain;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "product")
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Size(min = 1, max = 45)
    @Column(name="product_name")
    private String productName;

    @Min(0)
    @Column(name="price")
    private Double price;

    @Size(min = 1, max = 45)
    @Column(name ="category")
    private String category;

    @Min(0)
    @Column(name="weight")
    private Integer weight;

    @Size(min = 1, max = 45)
    @Column(name="volume")
    private String volume;

    @Min(0)
    @Column(name="amount")
    private Integer amount;

    @Column(name="image_path")
    private String imagePath;

    @Valid
    @OneToOne(mappedBy = "product",cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private Options option;

    @Valid
    @OneToMany(mappedBy = "product",fetch = FetchType.LAZY)
    private List<Order> orders;

    @Column(name = "sell_counter")
    private int sellCounter;

    public Product(String productName, Double price, String category, int sellCounter) {
        this.productName = productName;
        this.price = price;
        this.category = category;
        this.sellCounter=sellCounter;
    }

    public Product(){

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public Integer getAmount() {
        return amount;
    }

    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public Options getOption() {
        return option;
    }

    public void setOption(Options option) {
        this.option = option;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public int getSellCounter() {
        return sellCounter;
    }

    public void setSellCounter(int sellCounter) {
        this.sellCounter = sellCounter;
    }
}