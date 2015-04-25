package edu.neu.cs5200.project.models;

import java.io.Serializable;
import java.util.Collection;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown=true)
public class Reviews implements Serializable{

	private static final long serialVersionUID = 1L;
	private Collection<Review> review;
	public Collection<Review> getReview() {
		return review;
	}
	public void setReview(Collection<Review> review) {
		this.review = review;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Reviews(Collection<Review> review) {
		super();
		this.review = review;
	}
	public Reviews() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
