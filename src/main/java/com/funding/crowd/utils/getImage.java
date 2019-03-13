package com.funding.crowd.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class getImage {

	public static String getPath(String uploadPath,MultipartFile multipartfile,String basePath) throws IOException {
		//使用UUID重命名图片 避免重复
        String newName = UUID.randomUUID().toString().replaceAll("-", "");
      //处理上传文件
        String oldFileName = multipartfile.getOriginalFilename();
        //文件后缀
        String suffix = oldFileName.substring(oldFileName.lastIndexOf("."));
        //以绝对路径保存重命名后的图片
        multipartfile.transferTo(new File(uploadPath + "/" + newName+ suffix));
        //"http://localhost:8080/" + "upload/" + name + suffix
        //用于本机
        //String path="http://localhost:8080/crowdfunding/" + "upload/" + newName + suffix;
        //用于远程该服务器
        String path=basePath+"crowdfunding/" + "upload/" + newName + suffix;
		return path;
		
	}
}
