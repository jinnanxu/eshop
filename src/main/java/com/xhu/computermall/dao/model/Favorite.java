package com.xhu.computermall.dao.model;

import javax.persistence.*;

public class Favorite {
    @Id
    @Column(name = "favorite_id")
    private Integer favoriteId;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "product_id")
    private Integer productId;

    /**
     * @return favorite_id
     */
    public Integer getFavoriteId() {
        return favoriteId;
    }

    /**
     * @param favoriteId
     */
    public void setFavoriteId(Integer favoriteId) {
        this.favoriteId = favoriteId;
    }

    /**
     * @return user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * @param userId
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
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
}