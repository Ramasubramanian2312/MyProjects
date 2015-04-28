package edu.neu.cs5200.project.models;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the adminbean database table.
 * 
 */
@Entity
@Table(name="adminbean")
@NamedQuery(name="Adminbean.findAll", query="SELECT a FROM Adminbean a")
public class Adminbean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false, length=20)
	private String username;

	@Column(nullable=false, length=45)
	private String password;

	public Adminbean() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}