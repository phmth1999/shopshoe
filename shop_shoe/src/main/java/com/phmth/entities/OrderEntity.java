package com.phmth.entities;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "orders")
public class OrderEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "orderdate")
	private Date orderDate;

	@Column(name = "deliveryaddress")
	private String deliveryAddress;

	@Column(name = "totalquantity")
	private Integer totalQuantity;

	@Column(name = "totalprice")
	private double totalPrice;

	@Column(name = "status")
	private String status;

	@ManyToOne
	@JoinColumn(name = "userid")
	private UserEntity user;

	@OneToMany(mappedBy = "order")
	private Set<OrderDetailEntity> orderDetails;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public Integer getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public UserEntity getUser() {
		return user;
	}

	public void setUser(UserEntity user) {
		this.user = user;
	}

	public Set<OrderDetailEntity> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetailEntity> orderDetails) {
		this.orderDetails = orderDetails;
	}

}
