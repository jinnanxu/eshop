package com.xhu.computermall.dao.model;

import javax.persistence.*;

public class Item {
    @Id
    @Column(name = "item_id")
    private Integer itemId;

    @Column(name = "order_id")
    private Integer orderId;

    @Column(name = "product_id")
    private Integer productId;

    private Double price;

    private Integer qutity;

    private Integer iscomment;

    /**
     * @return item_id
     */
    public Integer getItemId() {
        return itemId;
    }

    /**
     * @param itemId
     */
    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    /**
     * @return order_id
     */
    public Integer getOrderId() {
        return orderId;
    }

    /**
     * @param orderId
     */
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

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
     * @return qutity
     */
    public Integer getQutity() {
        return qutity;
    }

    /**
     * @param qutity
     */
    public void setQutity(Integer qutity) {
        this.qutity = qutity;
    }

    /**
     * @return iscomment
     */
    public Integer getIscomment() {
        return iscomment;
    }

    /**
     * @param iscomment
     */
    public void setIscomment(Integer iscomment) {
        this.iscomment = iscomment;
    }
}