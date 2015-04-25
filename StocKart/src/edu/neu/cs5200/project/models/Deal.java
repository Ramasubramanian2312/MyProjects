package edu.neu.cs5200.project.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown=true)
public class Deal {

	private Integer itemId;
	private String name;
	private Double salePrice;
	private String largeImage;
	public Integer getItemId() {
		return itemId;
	}
	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}
	public String getLargeImage() {
		return largeImage;
	}
	public void setLargeImage(String largeImage) {
		this.largeImage = largeImage;
	}
	public Deal(Integer itemId, String name, Double salePrice, String largeImage) {
		super();
		this.itemId = itemId;
		this.name = name;
		this.salePrice = salePrice;
		this.largeImage = largeImage;
	}
	public Deal() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
