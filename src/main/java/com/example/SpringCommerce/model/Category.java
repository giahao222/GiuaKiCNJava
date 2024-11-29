package com.example.SpringCommerce.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;

    private String meta;

    private Boolean hide;

    @Column(name = "`order`")  // Vì `order` là từ khóa trong SQL, phải dùng backticks để bao quanh.
    private Integer order;

    private Date datebegin;

    // Constructor không tham số
    public Category() {}

    // Constructor có tham số
    public Category(String name, String meta, Boolean hide, Integer order, Date datebegin) {
        this.name = name;
        this.meta = meta;
        this.hide = hide;
        this.order = order;
        this.datebegin = datebegin;
    }

    // Getter và Setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMeta() {
        return meta;
    }

    public void setMeta(String meta) {
        this.meta = meta;
    }

    public Boolean getHide() {
        return hide;
    }

    public void setHide(Boolean hide) {
        this.hide = hide;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public Date getDatebegin() {
        return datebegin;
    }

    public void setDatebegin(Date datebegin) {
        this.datebegin = datebegin;
    }
}
