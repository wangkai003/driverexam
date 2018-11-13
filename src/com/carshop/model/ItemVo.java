package com.carshop.model;

import java.io.Serializable;

public class ItemVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; //id
	private String itemnum; //�������
	private Integer carid; //�������
	private String itemprice; //�۸�
	private String itemtime; //��������ʱ��
	private String estimate; //�û�����
	private Integer state; //����״̬ Ĭ����0:����;1: δ����;2: ����Ա�Ѵ���;
	private Integer orderid;
	private Car car; //ÿ��������ֻ��һ������;
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
