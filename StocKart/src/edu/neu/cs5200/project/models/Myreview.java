package edu.neu.cs5200.project.models;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the myreview database table.
 * 
 */
@Entity
@NamedQuery(name="Myreview.findAll", query="SELECT m FROM Myreview m")
public class Myreview implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int reviewId;

	private Integer itemId;

	private String itemName;

	private int rating;

	private String reviewer;

	private String reviewText;

	@Temporal(TemporalType.DATE)
	private Date submissionTime;

	private String title;

	public Myreview() {
	}

	public int getReviewId() {
		return this.reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public Integer getItemId() {
		return this.itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return this.itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getRating() {
		return this.rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getReviewer() {
		return this.reviewer;
	}

	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}

	public String getReviewText() {
		return this.reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public Date getSubmissionTime() {
		return this.submissionTime;
	}

	public void setSubmissionTime(Date submissionTime) {
		this.submissionTime = submissionTime;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

}