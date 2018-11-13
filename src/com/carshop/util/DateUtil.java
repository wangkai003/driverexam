package com.carshop.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

	public static String getNowDate() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String date = format.format(new Date());
		return date;
	}
}
