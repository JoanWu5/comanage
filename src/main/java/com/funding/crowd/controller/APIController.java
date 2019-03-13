package com.funding.crowd.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.funding.crowd.utils.GetAccounts;
import com.funding.crowd.utils.getImage;
import com.funding.crowd.pojo.APIContext;
import com.funding.crowd.pojo.Group;
import com.funding.crowd.pojo.ProcessIntro;
import com.funding.crowd.pojo.Project;
import com.funding.crowd.pojo.Setting;
import com.funding.crowd.service.ProjectService;

@Controller
@RequestMapping("api")
public class APIController {
	
	@Autowired
	private ProjectService projectservice;
	APIContext context = new APIContext();
	
	@RequestMapping("form")
	public String gotoform(String jointAccountId,HttpServletRequest request) {
		if(jointAccountId!=null) {
			//获取一个随机数
			UUID uuid = UUID.randomUUID();
		    String str = uuid.toString();
		  // 去掉"-"符号
		  //String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);
		  String temp = str.substring(0, 6);
		  //由于API所给的数前六位未知,所以这里用处理后的随机数字符串和挨批给的数的后五位进行拼接
		  String jointAccountIdUnique=temp+jointAccountId.substring(6, jointAccountId.length());
		  //存到这里之后在最后提交表单跳转之后的页面进行提示用户,告诉用户该jointAccountID并保存到安全的地方
		  request.getSession().setAttribute("jointAccountId", jointAccountIdUnique);
		}
		return "form";
	}
	@RequestMapping("addaccount")
	@ResponseBody
	public String addaccount(Model model,Project project,ProcessIntro processintro,Setting setting,Group group,HttpServletRequest request,HttpServletResponse response) throws IOException {
		 String msg = "";
		try {
			//设置编码
			request.setCharacterEncoding("UTF-8"); 
			 response.setContentType("text/html;charset=UTF-8");
			 //setting.setUpperlimitfunds(Double.parseDouble(upperLimitFunds));
			 //setting.setLowerlimitfunds(Double.parseDouble(lowerLimitFunds));
			
			//将值存入session中
			//request.getSession().setAttribute("project", project);
			request.getSession().setAttribute("category", project.getCategory());
			request.getSession().setAttribute("projectName", project.getProjectName());
			request.getSession().setAttribute("breifIntro", project.getBreifIntro());
			//request.getSession().setAttribute("projectImage", project.getProjectImage());
			request.getSession().setAttribute("stage", processintro.getStage());
			request.getSession().setAttribute("days", processintro.getDays());
			//request.getSession().setAttribute("processImage", processintro.getProcessImage());
			request.getSession().setAttribute("upperLimitFunds", setting.getUpperLimitFunds());
			request.getSession().setAttribute("lowerLimitFunds", setting.getLowerLimitFunds());
			request.getSession().setAttribute("scaleReviewing", setting.getScaleReviewing());
			request.getSession().setAttribute("scaleReport", setting.getScaleReport());
			//groupName
			request.getSession().setAttribute("groupName", group.getGroupName());
			request.getSession().setAttribute("groupbreifIntro", group.getGroupbreifIntro());
			request.getSession().setAttribute("participantId", group.getParticipantId());
			request.getSession().setAttribute("managerId", group.getManagerId());
			
			
			//System.out.println(request.getSession().getAttribute("projectName").toString());
			//System.out.println("hello test");
			 GetAccounts accs = new GetAccounts();
				
					//通过getaccounts函数获取BizToken,方便后续加密数据
					Map map = accs.getBizToken(context);
					//将获取到的数据放入到model中,传到jsp隐藏界面里,方便传递值
					String modulus = (String) map.get("modulus");
					String exponent = (String) map.get("exponent");
					String eventId = (String) map.get("eventId");
					request.getSession().setAttribute("modulus", modulus);
					request.getSession().setAttribute("exponent", exponent);
					request.getSession().setAttribute("eventId", eventId);
					model.addAttribute("modulus", modulus);
					model.addAttribute("exponent", exponent);
					model.addAttribute("eventId", eventId);
					//用于测试数据是否传入后台
					msg = "0";
				
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
	@RequestMapping("connect")
	public String connect() {
		//跳转到登录界面
		return "connect";
	}
	@RequestMapping("login")
	public String login(HttpServletRequest request, Model model,Project project) throws IOException {
		//将用户真实用户名username保存到session中去
		request.getSession().setAttribute("username", project.getUsername());
		//获取固定的static_username和static_password,利用这两个数据进行加密
		String static_username = request.getParameter("static_username");
        String static_password = request.getParameter("static_password");
        GetAccounts accs = new GetAccounts();
       	String accounts = accs.getAccounts(static_username, static_password,context);
        if(accounts != null){
    		model.addAttribute("accounts", accounts);
    		request.getSession().setAttribute("accounts", accounts);
    		//获取账户信息后跳转到指定API页面
    		return "accountSummary";
        }else{
        	return "errorPage";
        }
		
	}
	@RequestMapping("account")
	public String account(HttpServletRequest request,Project project, Model model) throws IOException{
        //获取从accountSummary.jsp中得到的accountid
		String accountId = request.getParameter("accountId");
		//将得到的accountId以及jointAccountId传入session中去
        request.getSession().setAttribute("accountId", project.getAccountId());
        GetAccounts accs = new GetAccounts();
        //获取账户详细信息
       	String accountDetails = accs.getAccountDetail(accountId, context);
       	//获取交易详细信息
       	String transactionDetails = accs.getTransactions(accountId, context);
       	if(accountDetails != null) {
    		model.addAttribute("accountDetails", accountDetails);
    		request.getSession().setAttribute("accountDetails", accountDetails);
       	}
       	if(transactionDetails != null){
    		model.addAttribute("transactionDetails", transactionDetails);
    		request.getSession().setAttribute("transactionDetails", transactionDetails);
    		
    		
       	}
        return "account";
    }
	@RequestMapping("submit")
	public String submit(Model model,Project project,ProcessIntro processintro,Setting setting,Group group,HttpServletRequest request,HttpServletResponse response) {
		project.setProjectName((String)request.getSession().getAttribute("projectName"));
		//jointAccountId,注意不要填空格,不然保存不到数据库
		project.setJointAccountId((String)request.getSession().getAttribute("jointAccountId"));
		project.setUsername((String)request.getSession().getAttribute("username"));
		project.setCategory((String)request.getSession().getAttribute("category"));
		project.setGruopName((String)request.getSession().getAttribute("groupName"));
		project.setBreifIntro((String)request.getSession().getAttribute("breifIntro"));
		project.setAccountId((String)request.getSession().getAttribute("accountId"));
		project.setProjectImage((String)request.getSession().getAttribute("projectPath"));
		//processintro
		processintro.setJointAccountId((String)request.getSession().getAttribute("jointAccountId"));
		processintro.setStage((String)request.getSession().getAttribute("stage"));
		processintro.setDays((int)request.getSession().getAttribute("days"));
		processintro.setProcessImage((String)request.getSession().getAttribute("processPath"));
		//setting
		setting.setJointAccountId((String)request.getSession().getAttribute("jointAccountId"));
		setting.setLowerLimitFunds((String)request.getSession().getAttribute("lowerLimitFunds"));
		setting.setScaleReport((String)request.getSession().getAttribute("scaleReport"));
		setting.setScaleReviewing((String)request.getSession().getAttribute("scaleReviewing"));
		setting.setUpperLimitFunds((String)request.getSession().getAttribute("upperLimitFunds"));
		//group
		group.setGroupbreifIntro((String)request.getSession().getAttribute("groupbreifIntro"));
		group.setGroupName((String)request.getSession().getAttribute("groupName"));
		group.setGroupImage((String)request.getSession().getAttribute("groupPath"));
		group.setManagerId((String)request.getSession().getAttribute("managerId"));
		group.setParticipantId((String)request.getSession().getAttribute("participantId"));
		String msg="提交失败,请核对提交数据!!!";
		try {
			//插入项目信息到项目表中
			projectservice.submitProject(project);
			//插入进程信息到进程表
			projectservice.submitProcess(processintro);
			//插入设置数据到数据库中
			projectservice.submitSetting(setting);
			//插入group数据到数据库中
			projectservice.submitGroup(group);
			//提交数据到后台保存到数据库
			msg="you have submitted successfully! your jointAccountId is:"+project.getJointAccountId()+"please save it in a secure place!";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("msg", msg);
		return "attention";
	}
	@RequestMapping("useexist")
	public String userExist(HttpServletRequest request) {
		//利用存在session中的username查询group表信息,前提是用户为登录状态
		String username=(String)request.getSession().getAttribute("username");
		//判断用户是否为登录状态
		if(username!=null) {
			Group group=projectservice.getGroup(username);
			request.getSession().setAttribute("groupName", group.getGroupName());
			request.getSession().setAttribute("groupbreifIntro", group.getGroupbreifIntro());
			request.getSession().setAttribute("participantId",group.getParticipantId());
			request.getSession().setAttribute("managerId", group.getManagerId());
		}
		return "form";
	}
	@RequestMapping("image")
	public String image() {
		return "image";
	}
	/*@RequestMapping("uploadfile")
	public String uploadfile(MultipartFile projectImage,HttpServletRequest request) throws IOException {
		//设置图片上传路径(服务器)
	    String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
	    String projectPath=getImage.getPath(uploadPath,projectImage);
	    request.getSession().setAttribute("projectPath", projectPath);
	    //project.setProjectImage(projectpath);
		return "form";
	}
	@RequestMapping("uploadfile2")
	public String uploadfile2(MultipartFile processImage,HttpServletRequest request) throws IOException {
        //设置图片上传路径(服务器)
        String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
        String processPath=getImage.getPath(uploadPath,processImage);
        request.getSession().setAttribute("processPath", processPath);
		return "form";	
	}
	@RequestMapping("uploadfile3")
	public String uploadfile3(MultipartFile groupImage,HttpServletRequest request) throws IOException {
        //设置图片上传路径(服务器)
        String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
        String groupPath=getImage.getPath(uploadPath,groupImage);
        request.getSession().setAttribute("groupPath", groupPath);
		return "form";	
	}*/
	@RequestMapping("uploadfile")
	   public String uploadfile(HttpServletRequest request,HttpServletResponse response) throws IOException {
		//获取本机或者服务器地址，http://本机地址或服务器IP地址：8080/
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ "/";  
		// 先实例化一个文件解析器
	        CommonsMultipartResolver coMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
	     // 判断request请求中是否有文件上传
	        if (coMultipartResolver.isMultipart(request)) {
	            // 转换request
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
	            // 获得文件
	            // 获得文件，方式二
	            //Return an java.util.Iterator of String objects containing the parameter names of the multipart files contained in this request.
	            //jsp页面的input标签可以有不同的name属性值
	            Iterator<String> fileNames = multiRequest.getFileNames();
	            while (fileNames.hasNext()) { 
	            	//循环遍历
	            	String fileName=fileNames.next();
	                MultipartFile file = multiRequest.getFile(fileName); //取出单个文件
	                if(!file.isEmpty()) {	                	
		            	if(fileName.equals("projectImage")) {
		            		 //设置图片上传路径(服务器)
		   	             String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		   	             String projectPath=getImage.getPath(uploadPath,multiRequest.getFile("projectImage"),basePath);
		   	             request.getSession().setAttribute("projectPath", projectPath);
		            	}else if(fileName.equals("processImage")) {
		            		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		   	                String processPath=getImage.getPath(uploadPath,multiRequest.getFile("processImage"),basePath);
		   	                request.getSession().setAttribute("processPath", processPath);
		            	}else if(fileName.equals("groupImage")) {
		            		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		   	                String groupPath=getImage.getPath(uploadPath,multiRequest.getFile("groupImage"),basePath);
		   	                request.getSession().setAttribute("groupPath", groupPath);
		            	}else {
		 	               request.getSession().setAttribute("msg", "没有接受到文件");
			            }
		            	
		            }
	            }
	           
	        }
	      
	      return "form";
	      
	   }
	@RequestMapping("uploadfiletest")
	   public String uploadfiletest(HttpServletRequest request,HttpServletResponse response,Setting setting) throws IOException {
		//获取本机或者服务器地址，http://本机地址或服务器IP地址：8080/
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ "/";    
		// 先实例化一个文件解析器
	        CommonsMultipartResolver coMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
	     // 判断request请求中是否有文件上传
	        if (coMultipartResolver.isMultipart(request)) {
	            // 转换request
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
	            // 获得文件
	            // 获得文件，方式二
	            //Return an java.util.Iterator of String objects containing the parameter names of the multipart files contained in this request.
	            //jsp页面的input标签可以有不同的name属性值
	            Iterator<String> fileNames = multiRequest.getFileNames();
	            while (fileNames.hasNext()) { 
	            	//循环遍历
	            	String fileName=fileNames.next();
	                MultipartFile file = multiRequest.getFile(fileName); //取出单个文件
	                if(!file.isEmpty()) {	                	
		            	if(fileName.equals("projectImage")) {
		            		 //设置图片上传路径(服务器)
		   	             String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		   	             String projectPath=getImage.getPath(uploadPath,multiRequest.getFile("projectImage"),basePath);
		   	             request.getSession().setAttribute("projectPath", projectPath);
		            	}else if(fileName.equals("processImage")) {
		            		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		   	                String processPath=getImage.getPath(uploadPath,multiRequest.getFile("processImage"),basePath);
		   	                request.getSession().setAttribute("processPath", processPath);
		            	}else if(fileName.equals("groupImage")) {
		            		String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		   	                String groupPath=getImage.getPath(uploadPath,multiRequest.getFile("groupImage"),basePath);
		   	                request.getSession().setAttribute("groupPath", groupPath);
		            	}else {
		 	               request.getSession().setAttribute("msg", "没有接受到文件");
			            }
		            	
		            }
	            }
	           
	        }
	        String upperLimitFunds=setting.getUpperLimitFunds();
	      if(upperLimitFunds!=null) {
	    	  request.getSession().setAttribute("upperLimitFunds", upperLimitFunds);
	      }
	      return "image";
	      
	   }
}
