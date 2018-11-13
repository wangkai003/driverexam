package com.carshop.model;

import java.io.Serializable;

public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String carbrand;
	private String carcategory;
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
	public String getCarcategory() {
		return carcategory;
	}
	public void setCarcategory(String carcategory) {
		this.carcategory = carcategory;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", carbrand=" + carbrand + ", carcategory=" + carcategory + "]";
	}
	
}
