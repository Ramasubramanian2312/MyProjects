package edu.neu.cs5200.project.models;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the orderdetail database table.
 * 
 */
@Entity
@Table(name="orderdetail")
@NamedQuery(name="Orderdetail.findAll", query="SELECT o FROM Orderdetail o")
public class Orderdetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer orderDetailId;

	@Column(nullable=false, length=45)
	private String itemId;

	@Column(length=256)
	private String name;

	@Column(nullable=false)
	private int quantity;

	@Column(length=45)
	private double salePrice;

	@Column(length=256)
	private String thumbnailImage;

	//bi-directional many-to-one association to Order
	@ManyToOne
	@JoinColumn(name="orderId", nullable=false)
	private Order order;

	public Orderdetail() {
	}
	

	public Orderdetail(Integer orderDetailId, String itemId, String name,
			int quantity, double salePrice, String thumbnailImage, Order order) {
		super();
		this.orderDetailId = orderDetailId;
		this.itemId = itemId;
		this.name = name;
		this.quantity = quantity;
		this.salePrice = salePrice;
		this.thumbnailImage = thumbnailImage;
		this.order = order;
	}



	public Integer getOrderDetailId() {
		return this.orderDetailId;
	}

	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}

	public String getItemId() {
		return this.itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSalePrice() {
		return this.salePrice;
	}

	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}

	public String getThumbnailImage() {
		return this.thumbnailImage;
	}

	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}


}