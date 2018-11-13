package com.carshop.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateConveter implements Converter<String, Date>{

	@Override
	public Date convert(String source) {
		try {
			if (null != source) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				return format.parse(source);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
