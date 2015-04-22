package edu.neu.cs5200.project.models;

import java.io.Serializable;
import java.util.List;

import javax.persistence.ElementCollection;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown=true)
public class Products implements Serializable {

	private List<Product> items;

	public List<Product> getItems() {
		return items;
	}


	public void setItems(List<Product> items) {
		this.items = items;
	}

	public Products() {
		super();
	}
}
