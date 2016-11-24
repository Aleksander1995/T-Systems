package com.mystore.domain;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;

@Entity
@Table(name = "options")
public class Options implements Serializable {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;

    @Size(min = 1, max = 45)
    @Column(name = "brand")
    private String brand;

    @Size(min = 1, max = 45)
    @Column(name ="color")
    private String color;

    @Size(min = 1, max = 45)
    @Column(name = "info")
    private String info;

    @OneToOne
    @JoinColumn(name = "id_product")
    private Product product;

    public Options(){
    }

    public long getId() {
        return id;
    }

    public String getBrand() {
        return brand;
    }

    public String getColor() {
        return color;
    }

    public String getInfo() {
        return info;
    }

    public Product getProduct() {
        return product;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}
