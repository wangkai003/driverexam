package com.carshop.model;

import java.io.Serializable;

public class ItemVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; //id
	private String itemnum; //订单编号
	private Integer carid; //车辆编号
	private String itemprice; //价格
	private String itemtime; //订单创建时间
	private String estimate; //用户评价
	private Integer state; //订单状态 默认是0:在售;1: 未付款;2: 管理员已处理;
	private Integer orderid;
	private Car car; //每个订单项只有一辆订单;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getItemnum() {
		return itemnum;
	}
	public void setItemnum(String itemnum) {
		this.itemnum = itemnum;
	}
	public Integer getCarid() {
		return carid;
	}
	public void setCarid(Integer carid) {
		this.carid = carid;
	}
	public String getItemprice() {
		return itemprice;
	}
	public void setItemprice(String itemprice) {
		this.itemprice = itemprice;
	}
	public String getItemtime() {
		return itemtime;
	}
	public void setItemtime(String itemtime) {
		this.itemtime = itemtime;
	}
	public String getEstimate() {
		return estimate;
	}
	public void setEstimate(String estimate) {
		this.estimate = estimate;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	@Override
	public String toString() {
		return "ItemVo [id=" + id + ", itemnum=" + itemnum + ", carid=" + carid + ", itemprice=" + itemprice
				+ ", itemtime=" + itemtime + ", estimate=" + estimate + ", state=" + state + ", orderid=" + orderid
				+ ", car=" + car + "]";
	}
	
}
