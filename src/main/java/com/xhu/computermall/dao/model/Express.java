package com.xhu.computermall.dao.model;

import java.util.Date;
import javax.persistence.*;

public class Express {
    @Id
    @Column(name = "express_id")
    private Integer expressId;

    @Column(name = "order_id")
    private Integer orderId;

    @Column(name = "exp_time")
    private Date expTime;

    @Column(name = "curr_location")
    private String currLocation;
    
    @Column(name = "express_no")
    private String expressNo;

    private String remark;

    /**
     * @return express_id
     */
    public Integer getExpressId() {
        return expressId;
    }

    /**
     * @param expressId
     */
    public void setExpressId(Integer expressId) {
        this.expressId = expressId;
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
     * @return exp_time
     */
    public Date getExpTime() {
        return expTime;
    }

    /**
     * @param expTime
     */
    public void setExpTime(Date expTime) {
        this.expTime = expTime;
    }

    /**
     * @return curr_location
     */
    public String getCurrLocation() {
        return currLocation;
    }

    /**
     * @param currLocation
     */
    public void setCurrLocation(String currLocation) {
        this.currLocation = currLocation == null ? null : currLocation.trim();
    }

    /**
     * @return remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public String getExpressNo() {
		return expressNo;
	}

	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}
}