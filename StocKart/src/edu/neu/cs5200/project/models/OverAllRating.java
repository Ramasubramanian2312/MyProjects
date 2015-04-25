package edu.neu.cs5200.project.models;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown=true)
public class OverAllRating implements Serializable {

	private static final long serialVersionUID = 1L;
	String label;
	Integer rating;
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public OverAllRating(String label, Integer rating) {
		super();
		this.label = label;
		this.rating = rating;
	}
	public OverAllRating() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
