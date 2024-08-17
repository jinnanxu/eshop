package com.xhu.computermall.dao.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "t_order")
public class TOrder {
    @Id
    @Column(name = "order_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderId;

    @Column(name = "user_id")
    private Integer userId;
    
    @Column(name = "order_code")
    private String orderCode;

    @Column(name = "order_time")
    private Date orderTime;

    @Column(name = "total_price")
    private Double totalPrice;

    @Column(name = "receive_name")
    private String receiveName;

    @Column(name = "full_address")
    private String fullAddress;

    private String mobile;

    private Integer status;

    private String remark;
    
    @Column(name = "exp_no")
    private String expNo;

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
     * @return order_time
     */
    public Date getOrderTime() {
        return orderTime;
    }

    /**
     * @param orderTime
     */
    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    /**
     * @return total_price
     */
    public Double getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice
     */
    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    /**
     * @return receive_name
     */
    public String getReceiveName() {
        return receiveName;
    }

    /**
     * @param receiveName
     */
    public void setReceiveName(String receiveName) {
        this.receiveName = receiveName == null ? null : receiveName.trim();
    }

    /**
     * @return full_address
     */
    public String getFullAddress() {
        return fullAddress;
    }

    /**
     * @param fullAddress
     */
    public void setFullAddress(String fullAddress) {
        this.fullAddress = fullAddress == null ? null : fullAddress.trim();
    }

    /**
     * @return mobile
     */
    public String getMobile() {
        return mobile;
    }

    /**
     * @param mobile
     */
    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
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

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getExpNo() {
		return expNo;
	}

	public void setExpNo(String expNo) {
		this.expNo = expNo;
	}
}