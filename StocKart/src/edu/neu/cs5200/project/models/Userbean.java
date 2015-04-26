package edu.neu.cs5200.project.models;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;


/**
 * The persistent class for the userbean database table.
 * 
 */
@Entity
@Table(name="userbean")
@NamedQuery(name="Userbean.findAll", query="SELECT u FROM Userbean u")
public class Userbean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false, length=20)
	private String username;

	@Column(nullable=false, length=70)
	private String emailId;

	@Column(nullable=false, length=45)
	private String password;

	//bi-directional one-to-one association to Custinfo
	@OneToOne(mappedBy="userbean", cascade=CascadeType.MERGE)
	private Custinfo custinfo;
	
	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="userbean")
	private List<Order> orders;

	public Userbean() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmailId() {
		return this.emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Custinfo getCustinfo() {
		return this.custinfo;
	}

	public void setCustinfo(Custinfo custinfo) {
		this.custinfo = custinfo;
	}
	
	
	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	

	public Order addOrder(Order order) {
	getOrders().add(order);
	order.setUserbean(this);

	return order;
}

	public Order removeOrder(Order order) {
	getOrders().remove(order);
	order.setUserbean(null);

	return order;
	}

	public static void main(String[] args) {

	}


}