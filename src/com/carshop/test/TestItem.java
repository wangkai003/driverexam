package com.carshop.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.carshop.model.Item;
import com.carshop.model.PageBean;
import com.carshop.service.ItemService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:spring-config.xml"})
public class TestItem {

	
	@Autowired
	private ItemService itemService;
	@Test
	public void testgetItemListByItemNum() {
		PageBean<Item> pageBean = itemService.getItemListByItemNum(null, 1, 12);
		List<Item> list = pageBean.getList();
		for (Item item : list) {
			System.out.println(item);
		}
	}
}
