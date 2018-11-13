package com.carshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carshop.dao.ItemMapper;
import com.carshop.model.Item;
import com.carshop.model.PageBean;
import com.carshop.service.ItemService;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemMapper itemMapper;
	@Override
	public Integer insertItem(Item item) {
		
		return itemMapper.insertItem(item);
	}
	@Override
	public List<Item> getItemByOrderId(Integer orderId) {
		List<Item> itemList = itemMapper.getItemByOrderId(orderId);
		return itemList;
	}
	@Override
	public PageBean<Item> getItemListByItemNum(String searchItemNum, Integer currentPage, Integer currentCount) {
		PageBean<Item> pageBean = new PageBean<>();
		//每页显示条数
		pageBean.setCurrentCount(currentCount);
		//当前页数
		pageBean.setCurrentPage(currentPage);
		//总记录数
		Integer totalCount = itemMapper.getTotalCountByItemNum(searchItemNum).intValue();
		pageBean.setTotalCount(totalCount);
		//总页数
		Integer totalPage = Integer.valueOf((int)Math.ceil(1.0*totalCount/currentCount));
		pageBean.setTotalPage(totalPage);
		//当前页显示信息
		//index
		Integer index = (currentPage - 1)*currentCount;
		List<Item> itemList = itemMapper.getItemListByItemNum(searchItemNum, index, currentCount);
		pageBean.setList(itemList);
		return pageBean;
	}
	@Override
	public Item getItemByCarId(Integer carid) {
		
		return itemMapper.getItemByCarId(carid);
	}
	@Override
	public void updateEstimate(String estimate, Integer carid) {
		itemMapper.updateEstimate(estimate, carid);
	}
	@Override
	public void updateState(Integer id, Integer state) {
		itemMapper.updateState(id, state);
	}
	@Override
	public Item getItemById(Integer id) {
		
		return itemMapper.getItemById(id);
	}
	@Override
	public void deleteItemById(Integer id) {
		itemMapper.deleteItemById(id);
	}
}
