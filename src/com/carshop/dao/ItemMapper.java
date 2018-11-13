package com.carshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.Item;

public interface ItemMapper {

	/**
	 * 创建订单
	 * @param item
	 * @return
	 */
	public Integer insertItem(Item item);
	/**
	 * 根据订单查询订单项
	 * @param orderId
	 * @return
	 */
	public List<Item> getItemByOrderId(Integer orderId);
	/**
	 * 根据itemNum查询总记录数
	 * @param itemNum
	 * @return
	 */
	public Long getTotalCountByItemNum(@Param("itemnum")String itemnum);
	/**
	 * 根据itemnum查询itemList
	 * @param itemnum
	 * @param index
	 * @param currentCount
	 * @return
	 */
	public List<Item> getItemListByItemNum(@Param("itemnum")String itemnum,@Param("index")Integer index,@Param("currentCount")Integer currentCount);
	
	//防止重复提交订单
	public Item getItemByCarId(Integer carid);
	
	public void updateEstimate(@Param("estimate")String estimate,@Param("carid")Integer carid);
	
	public void updateState(@Param("id")Integer id,@Param("state")Integer state);
	
	public Item getItemById(Integer id);
	
	public void deleteItemById(Integer id);
}
