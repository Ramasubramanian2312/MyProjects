package edu.neu.cs5200.project.models;

import java.io.Serializable;

import javax.persistence.*;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the orders database table.
 * 
 */
@Entity
@Table(name="orders")
@NamedQuery(name="Order.findAll", query="SELECT o FROM Order o")
public class Order implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer orderId;

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

	//bi-directional many-to-one association to Orderdetail
	@OneToMany(mappedBy="order")
	private List<Orderdetail> orderdetails;
	
	//bi-directional one-to-one association to Custinfo
	@OneToOne(mappedBy="order", cascade=CascadeType.MERGE)
	private Payment payment;


	public Order() {
	}

	public Payment getPayment() {
		return this.payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	
	
	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
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

	public List<Orderdetail> getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(List<Orderdetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public Orderdetail addOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().add(orderdetail);
		orderdetail.setOrder(this);

		return orderdetail;
	}

	public Orderdetail removeOrderdetail(Orderdetail orderdetail) {
		getOrderdetails().remove(orderdetail);
		orderdetail.setOrder(null);

		return orderdetail;
	}

	public Order(Integer orderId, Date orderDate, String orderStatus,
			double totalPrice, Userbean userbean, List<Orderdetail> orderdetails) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.totalPrice = totalPrice;
		this.userbean = userbean;
		this.orderdetails = orderdetails;
	}
	
	

}