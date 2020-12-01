package com.project.shop.util;
import java.io.File;
import java.util.Calendar;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	public String save(MultipartFile photo, File dest) throws Exception{
		
		if(!dest.exists()) {
			dest.mkdirs();
		}
		Calendar cal = Calendar.getInstance();
		long time =cal.getTimeInMillis();
		String name =photo.getOriginalFilename();
		name=time+"_"+name;
		dest = new File(dest, name);
		photo.transferTo(dest);
		return name;
	}
}