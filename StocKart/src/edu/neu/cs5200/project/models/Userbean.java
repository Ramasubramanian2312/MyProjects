package edu.neu.cs5200.project.models;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the userbean database table.
 * 
 */
@Entity
@NamedQuery(name="Userbean.findAll", query="SELECT u FROM Userbean u")
public class Userbean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String username;

	private String emailId;

	private String password;

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

}