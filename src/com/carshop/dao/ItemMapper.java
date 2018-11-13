package com.carshop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.carshop.model.Item;

public interface ItemMapper {

	/**
	 * ��������
	 * @param item
	 * @return
	 */
	public Integer insertItem(Item item);
	/**
	 * ���ݶ�����ѯ������
	 * @param orderId
	 * @return
	 */
	public List<Item> getItemByOrderId(Integer orderId);
	/**
	 * ����itemNum��ѯ�ܼ�¼��
	 * @param itemNum
	 * @return
	 */
	public Long getTotalCountByItemNum(@Param("itemnum")String itemnum);
	/**
	 * ����itemnum��ѯitemList
	 * @param itemnum
	 * @param index
	 * @param currentCount
	 * @return
	 */
	public List<Item> getItemListByItemNum(@Param("itemnum")String itemnum,@Param("index")Integer index,@Param("currentCount")Integer currentCount);
	
	//��ֹ�ظ��ύ����
	public Item getItemByCarId(Integer carid);
	
	public void updateEstimate(@Param("estimate")String estimate,@Param("carid")Integer carid);
	
	public void updateState(@Param("id")Integer id,@Param("state")Integer state);
	
	public Item getItemById(Integer id);
	
	public void deleteItemById(Integer id);
}
