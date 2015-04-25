package edu.neu.cs5200.project.models;

import java.io.Serializable;
import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@JsonIgnoreProperties(ignoreUnknown=true)
public class Review implements Serializable{

	private static final long serialVersionUID = 1L;
	OverAllRating overallRating;
	String reviewer;
	String reviewText;
	Date submissionTime;
	String title;
	public OverAllRating getOverallRating() {
		return overallRating;
	}
	public void setOverallRating(OverAllRating overallRating) {
		this.overallRating = overallRating;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	public Date getSubmissionTime() {
		return submissionTime;
	}
	public void setSubmissionTime(Date submissionTime) {
		this.submissionTime = submissionTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Review(OverAllRating overallRating, String reviewer,
			String reviewText, Date submissionTime, String title) {
		super();
		this.overallRating = overallRating;
		this.reviewer = reviewer;
		this.reviewText = reviewText;
		this.submissionTime = submissionTime;
		this.title = title;
	}
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
