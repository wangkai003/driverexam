package com.carshop.model;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

public class Car implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id; //id
	private String carBrand; //Ʒ��
	private String carSeries; //��ϵ
	private String carModel; //����
	private String caryear; //����
	private Double price; //���ۼ۸�
	private String iocationCity; //���ڳ���
	private String mileage; //���
	private String displacement; //����
	private String carColor; //��ɫ
	private String carCardFirstTime; //����ʱ��
	private Integer contactPeople_id; //��ϵ��id
	private String carimg; //ͼƬ
	private Integer carstate;//����״̬,Ĭ��0,��ͨ��.
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public Integer getCarstate() {
		return carstate;
	}
	public void setCarstate(Integer carstate) {
		this.carstate = carstate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCarBrand() {
		return carBrand;
	}
	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}
	public String getCarSeries() {
		return carSeries;
	}
	public void setCarSeries(String carSeries) {
		this.carSeries = carSeries;
	}
	public String getCarModel() {
		return carModel;
	}
	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	public String getCaryear() {
		return caryear;
	}
	public void setCaryear(String caryear) {
		this.caryear = caryear;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getIocationCity() {
		return iocationCity;
	}
	public void setIocationCity(String iocationCity) {
		this.iocationCity = iocationCity;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getDisplacement() {
		return displacement;
	}
	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}
	public String getCarColor() {
		return carColor;
	}
	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	public Integer getContactPeople_id() {
		return contactPeople_id;
	}
	public void setContactPeople_id(Integer contactPeople_id) {
		this.contactPeople_id = contactPeople_id;
	}
	public String getCarimg() {
		return carimg;
	}
	public void setCarimg(String carimg) {
		this.carimg = carimg;
	}
	public String getCarCardFirstTime() {
		return carCardFirstTime;
	}
	public void setCarCardFirstTime(String carCardFirstTime) {
		this.carCardFirstTime = carCardFirstTime;
	}
	@Override
	public String toString() {
		return "Car [id=" + id + ", carBrand=" + carBrand + ", carSeries=" + carSeries + ", carModel=" + carModel
				+ ", caryear=" + caryear + ", price=" + price + ", iocationCity=" + iocationCity + ", mileage="
				+ mileage + ", displacement=" + displacement + ", carColor=" + carColor + ", carCardFirstTime="
				+ carCardFirstTime + ", contactPeople_id=" + contactPeople_id + ", carimg=" + carimg + ", carstate="
				+ carstate + "]";
	}
	
}
