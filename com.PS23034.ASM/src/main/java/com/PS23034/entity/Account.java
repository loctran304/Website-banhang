package com.PS23034.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Data;
@Data
@Entity
@Table(name = "accounts")
public class Account implements Serializable{
	
	@Id
	String username;
	String password;
	String fullname;
	String email;
	String photo;
	
	@Column(nullable = false, columnDefinition = "bit default 0")
	boolean activated;
	
	boolean admin;
	@OneToMany(mappedBy = "account")
	List<Order> orders;
}
