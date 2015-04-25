package edu.neu.cs5200.project.models;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Id;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown=true)
public class ReviewItem implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	private int itemId;
	private String name;
	Collection<Review> reviews;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Collection<Review> getReviews() {
		return reviews;
	}
	public void setReviews(Collection<Review> reviews) {
		this.reviews = reviews;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public ReviewItem(int itemId, String name, Collection<Review> reviews) {
		super();
		this.itemId = itemId;
		this.name = name;
		this.reviews = reviews;
	}
	public ReviewItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
