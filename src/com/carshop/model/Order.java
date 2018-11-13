package com.carshop.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Order implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;  //id
	private Integer userid; //用户id
	private Double orderprice; //订单总价格
	
	private List<Item> itemList = new ArrayList<>(); //多个订单项
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<Item> getItemList() {
		return itemList;
	}
	public void setItemList(List<Item> itemList) {
		this.itemList = itemList;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Double getOrderprice() {
		return orderprice;
	}
	public void setOrderprice(Double orderprice) {
		this.orderprice = orderprice;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", userid=" + userid + ", orderprice=" + orderprice + ", itemList=" + itemList
				+ ", user=" + user + "]";
	}
	
}
