package edu.neu.cs5200.project.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the order database table.
 * 
 */
@Entity
@Table(name="order")
@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	private int orderId;

	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date orderDate;

	@Column(nullable=false, length=45)
	private String orderStatus;

	@Column(nullable=false)
	private double totalPrice;

	//bi-directional many-to-one association to Userbean
	@ManyToOne
	@JoinColumn(name="customerId", nullable=false)
	private Userbean userbean;

	public Order() {
	}

	public int getOrderId() {
		return this.orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return this.orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getTotalPrice() {
		return this.totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Userbean getUserbean() {
		return this.userbean;
	}

	public void setUserbean(Userbean userbean) {
		this.userbean = userbean;
	}

}