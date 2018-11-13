package com.carshop.model;

import java.util.ArrayList;
import java.util.List;

public class PageBean<T> {

	private Integer currentPage;//��ǰҳ��
	private Integer currentCount; //��ǰҳ�ļ�¼��
	private Integer totalPage;//��ҳ��
	private Integer totalCount;//�ܼ�¼��
	private List<T> list = new ArrayList<>();//���󼯺�
	
	//��ȡ��ǰҳ��
	public Integer getCurrentPage() {
		if (currentPage < 1) {
			return 1;
		}
		if (currentPage > totalPage) {
			if (totalPage == 0) {
				return 1;
			}
			return totalPage;
		}
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(Integer currentCount) {
		this.currentCount = currentCount;
	}
	//��ȡ��ҳ��
	public Integer getTotalPage() {
		return Integer.valueOf((int)Math.ceil(1.0*totalCount/currentCount));
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
}
