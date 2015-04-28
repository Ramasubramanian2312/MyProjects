package edu.neu.cs5200.project.models;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the wishlist database table.
 * 
 */
@Entity
@Table(name="wishlist")
@NamedQuery(name="Wishlist.findAll", query="SELECT w FROM Wishlist w")
public class Wishlist implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false)
	private String itemId;

	@Column(nullable=false, length=20)
	private String customerId;

	@Column(length=256)
	private String name;

	@Column(nullable=false)
	private double salePrice;

	@Column(length=256)
	private String thumbnailImage;

	public Wishlist() {
	}

	public String getItemId() {
		return this.itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getCustomerId() {
		return this.customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

}