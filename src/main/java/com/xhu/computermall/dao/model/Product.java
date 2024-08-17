package com.xhu.computermall.dao.model;

import java.util.Date;
import javax.persistence.*;

public class Product {
    @Id
    @Column(name = "product_id")
    private Integer productId;

    private Integer category;

    private String name;

    private Double price;

    @Column(name = "publish_time")
    private Date publishTime;

    private String pic;

    private Double discount;

    private Integer quantity;

    @Column(name = "sub_title")
    private String subTitle;

    private Integer status;

    @Column(name = "view_count")
    private Integer viewCount;

    @Column(name = "sale_count")
    private Integer saleCount;

    private String describ;

    /**
     * @return product_id
     */
    public Integer getProductId() {
        return productId;
    }

    /**
     * @param productId
     */
    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    /**
     * @return category
     */
    public Integer getCategory() {
        return category;
    }

    /**
     * @param category
     */
    public void setCategory(Integer category) {
        this.category = category;
    }

    /**
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * @return price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * @param price
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * @return publish_time
     */
    public Date getPublishTime() {
        return publishTime;
    }

    /**
     * @param publishTime
     */
    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    /**
     * @return pic
     */
    public String getPic() {
        return pic;
    }

    /**
     * @param pic
     */
    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    /**
     * @return discount
     */
    public Double getDiscount() {
        return discount;
    }

    /**
     * @param discount
     */
    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    /**
     * @return quantity
     */
    public Integer getQuantity() {
        return quantity;
    }

    /**
     * @param quantity
     */
    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    /**
     * @return sub_title
     */
    public String getSubTitle() {
        return subTitle;
    }

    /**
     * @param subTitle
     */
    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle == null ? null : subTitle.trim();
    }

    /**
     * @return status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * @return view_count
     */
    public Integer getViewCount() {
        return viewCount;
    }

    /**
     * @param viewCount
     */
    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    /**
     * @return sale_count
     */
    public Integer getSaleCount() {
        return saleCount;
    }

    /**
     * @param saleCount
     */
    public void setSaleCount(Integer saleCount) {
        this.saleCount = saleCount;
    }

    /**
     * @return describ
     */
    public String getDescrib() {
        return describ;
    }

    /**
     * @param describ
     */
    public void setDescrib(String describ) {
        this.describ = describ == null ? null : describ.trim();
    }
}