package edu.neu.cs5200.project.models;

import java.io.Serializable;

import javax.persistence.*;


/**
 * The persistent class for the custinfo database table.
 * 
 */
@Entity
@Table(name="custinfo")
@NamedQuery(name="Custinfo.findAll", query="SELECT c FROM Custinfo c")
public class Custinfo implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(unique=true, nullable=false, length=20)
	private String username;

	@Column(length=256)
	private String address;

	@Column(length=256)
	private String firstname;

	@Column(length=10)
	private String gender;

	@Column(length=256)
	private String lastname;

	//bi-directional one-to-one association to Userbean
	@OneToOne
	@JoinColumn(name="username", nullable=false, insertable=false, updatable=false)
	private Userbean userbean;

	public Custinfo() {
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Userbean getUserbean() {
		return this.userbean;
	}

	public void setUserbean(Userbean userbean) {
		this.userbean = userbean;
	}

	public Custinfo(String username, String address, String firstname,
			String gender, String lastname, Userbean userbean) {
		super();
		this.username = username;
		this.address = address;
		this.firstname = firstname;
		this.gender = gender;
		this.lastname = lastname;
		this.userbean = userbean;
	}

	
}