package com.carshop.service;

import java.util.List;

import com.carshop.model.Item;
import com.carshop.model.PageBean;

public interface ItemService {

	public Integer insertItem(Item item);
	
	public List<Item> getItemByOrderId(Integer orderId);
	
	/**
	 * ���ݶ����Ų�ѯitem��Ϣ
	 * @param searchItemNum
	 * @param currentPage
	 * @param currentCount
	 * @return
	 */
	public PageBean<Item> getItemListByItemNum(String searchItemNum,Integer currentPage,Integer currentCount);
	
	/**
	 * ����carid��ѯitem��
	 * @param carid
	 * @return
	 */
	public Item getItemByCarId(Integer carid);
	
	public void updateEstimate(String estimate,Integer carid);
	
	public void updateState(Integer id,Integer state);
	
	public Item getItemById(Integer id);
	
	public void deleteItemById(Integer id);
}
