package edu.neu.cs5200.project.models;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="payment")
@NamedQuery(name="Payment.findAll", query="SELECT p FROM Payment p")
public class Payment implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(unique=true, nullable=false)
	private int orderId;

	@Id
	@Column(unique=true, nullable=false)
	private String trxnId;

	@Column
	private double amount;
	
	@Temporal(TemporalType.DATE)
	@Column(nullable=false)
	private Date paymentDate;

	//bi-directional one-to-one association to Userbean
	@OneToOne
	@JoinColumn(name="orderId", nullable=false, insertable=false, updatable=false)
	private Order order;

	
	public String getTrxnId() {
		return trxnId;
	}

	public void setTrxnId(String trxnId) {
		this.trxnId = trxnId;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Payment(String trxnId, double amount, Date paymentDate, Order order) {
		super();
		this.trxnId = trxnId;
		this.amount = amount;
		this.paymentDate = paymentDate;
		this.order = order;
	}
	
	
}
