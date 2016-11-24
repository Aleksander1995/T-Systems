package main.com.report.dto;

import java.util.List;

public class Product {
    private long id;

    private String productName;

    private Double price;

    private String category;

    private int sellCounter;

    private Integer weight;

    private String volume;

    private Integer amount;

    private String imagePath;

    private Object option;

    private List<Object> orders;

    public Product(){}

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

    public Object getOption() {
        return option;
    }

    public void setOption(Object option) {
        this.option = option;
    }

    public List<Object> getOrders() {
        return orders;
    }

    public void setOrders(List<Object> orders) {
        this.orders = orders;
    }

    public int getSellCounter() {
        return sellCounter;
    }

    public void setSellCounter(int sellCounter) {
        this.sellCounter = sellCounter;
    }
}
