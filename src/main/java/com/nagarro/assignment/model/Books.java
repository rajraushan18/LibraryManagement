package com.nagarro.assignment.model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Books {

	@Id
	private int code;
	private String name;
	private String author;
	private String data_added;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getData_added() {
		return data_added;
	}

	public void setData_added(String d) {
		
		LocalDate data_added = LocalDate.now();
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd MMM yyyy");
		this.data_added = data_added.format(myFormatObj);
	}

}
