package com.carshop.model;

import java.io.Serializable;

public class CarIndex implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String carbrand;
	private String carstyle;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCarbrand() {
		return carbrand;
	}
	public void setCarbrand(String carbrand) {
		this.carbrand = carbrand;
	}
	public String getCarstyle() {
		return carstyle;
	}
	public void setCarstyle(String carstyle) {
		this.carstyle = carstyle;
	}
	@Override
	public String toString() {
		return "CarIndex [id=" + id + ", carbrand=" + carbrand + ", carstyle=" + carstyle + "]";
	}
	
}
