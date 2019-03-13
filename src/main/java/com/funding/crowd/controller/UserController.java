package com.funding.crowd.controller;

import java.io.File;
import java.io.IOException;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpRequest;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.funding.crowd.pojo.User;
import com.funding.crowd.service.UserService;
import com.funding.crowd.utils.getImage;
@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userservice;
	@Autowired
	@Qualifier("javaMailSender")
    private JavaMailSender javaMailSender;//在spring中配置的邮件发送的bean
  
	
	@RequestMapping("welcome")
	public String user() {
		return "welcome";
	}
	@RequestMapping("signup")
	public String signup() {
		//转发到注册页面
		return "signup";
	}
	@RequestMapping("sign")
	@ResponseBody
	public String sign(User user) {
		String msg="1";
		//进行注册
		try {
			userservice.signup(user);
			//注册成功则返回0的信息传递给前台的ajax处理
			msg="0";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	@RequestMapping("signin")
	public String signin(Model model,User user,HttpServletRequest request) {
		int flag=userservice.signin(user);
		if(flag>0)
		{
			request.getSession().setAttribute("username",user.getUsername());
			request.getSession().setAttribute("user", user);
			//如果登录成功则跳转到personalHome页
			return "personalHome";
		}else {
			String msg="登陆失败,请重新登录";
			model.addAttribute("msg",msg);
			return "index";
		}
	}
	@RequestMapping("home")
	public String home() {
		return "home";
	}
	@RequestMapping("sendmail")
	public String senMail(String name,String email,String message,Model model) {
		String msg="1";
		  MimeMessage mMessage=javaMailSender.createMimeMessage();//创建邮件对象
	        MimeMessageHelper mMessageHelper;
	        Properties prop = new Properties();
	        String from;
	        try {
	            //从配置文件中拿到发件人邮箱地址
	            prop.load(this.getClass().getResourceAsStream("/mail.properties"));
	            from = prop.get("mail.smtp.username")+"";
	            //from="alexgangxi@163.com";
	            mMessageHelper=new MimeMessageHelper(mMessage,true);
	            mMessageHelper.setFrom(from);//发件人邮箱
	            mMessageHelper.setTo("alexgangxi@163.com");//收件人邮箱
	            mMessageHelper.setSubject(email+"的邮件发送");//邮件的主题
	            mMessageHelper.setText("<p>"+message+"</p><br/>" +
	                    "<a href='#'>Comanage</a><br/>" +
	                    "",true);//邮件的文本内容，true表示文本以html格式打开
	            //File file=new File("F:/img/枫叶.png");//在邮件中添加一张图片
	            //FileSystemResource resource=new FileSystemResource(file);
	            //mMessageHelper.addInline("fengye", resource);//这里指定一个id,在上面引用
	            //mMessageHelper.addAttachment("枫叶.png", resource);//在邮件中添加一个附件
	            javaMailSender.send(mMessage);//发送邮件
	            //msg为0表示发送邮件成功,传递给jsp的ajax进行判断
	            msg="0";
	            model.addAttribute("msg", msg);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
		return "home"; 
	}
	@RequestMapping("personalinfo")
	public String personalinfo() {
		
		return "personalinfo";
	}
	@SuppressWarnings("null")
	@RequestMapping("buildinfo")
	public String buildinfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
		//获取本机或者服务器地址，http://本机地址或服务器IP地址：8080/
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ "/"; 
		String judge=request.getParameter("judge");
		//利用前台传来的judge字符串判断是否信息有保存到session中，为1，则点击了finish按钮但是信息没有保存到session中需要先保存再保存到数据库
        if(judge.equals("1")) {
			// 先实例化一个文件解析器
	        CommonsMultipartResolver coMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
	     // 判断request请求中是否有文件上传
	        if (coMultipartResolver.isMultipart(request)) {
	        	// 转换request
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
	            // 获得文件
	            MultipartFile file = multiRequest.getFile("userImage"); //取出单个文件
	            //设置图片上传路径(服务器)
		        String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		        String userPath=getImage.getPath(uploadPath,file,basePath);
		        request.getSession().setAttribute("userPath", userPath);
	        }
	            request.getSession().setAttribute("firstName", request.getParameter("firstName"));
	            request.getSession().setAttribute("lastName", request.getParameter("lastName"));
	            request.getSession().setAttribute("email", request.getParameter("email"));
	            User user=new User();
	            //不要用null赋给user+
	            user.setFirstName(request.getParameter("firstName"));
				user.setLastName(request.getParameter("lastName"));
				user.setEmail(request.getParameter("email"));
				user.setUserImage((String)request.getSession().getAttribute("userPath"));
				//根据用户的username，将新增信息插入到原有的user表中
				user.setUsername((String)request.getSession().getAttribute("username"));
				try {
					//将新增用户信息插入到user表中
					userservice.submitinfo(user);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return "personalHome";
	            
        }else {//如果judge不是“1”,则不是点击finish触发的，直接先保存到session中去，然后根据用户 操作界面跳转
        	// 先实例化一个文件解析器
	        CommonsMultipartResolver coMultipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
	     // 判断request请求中是否有文件上传
	        if (coMultipartResolver.isMultipart(request)) {
	        	// 转换request
	            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
	            // 获得文件
	            MultipartFile file = multiRequest.getFile("userImage"); //取出单个文件
	            //设置图片上传路径(服务器)
		        String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
		        String userPath=getImage.getPath(uploadPath,file,basePath);
		        request.getSession().setAttribute("userPath", userPath);
	        }
	            request.getSession().setAttribute("firstName", request.getParameter("firstName"));
	            request.getSession().setAttribute("lastName", request.getParameter("lastName"));
	            request.getSession().setAttribute("email", request.getParameter("email"));
	            String action=request.getParameter("action");
	            
	            //跳转到用户要操作的界面
	            if(action.equals("create")) {
	            	return "form";
	            }else if(action.equals("manage")) {
	            	return "manage";
	            }else if(action.equals("participate")) {
	            	return "participate";
	            }else {
	            	return "personalinfo";
	            }
        }
           
	}
	//submitinfo
		@RequestMapping("submitinfo")
		public String submitinfo(HttpServletRequest request,HttpServletResponse response,User user) {
			user.setFirstName((String)request.getSession().getAttribute("firstName"));
			user.setLastName((String)request.getSession().getAttribute("lastName"));
			user.setEmail((String)request.getSession().getAttribute("email"));
			user.setUserImage((String)request.getSession().getAttribute("userPath"));
			//根据用户的username，将新增信息插入到原有的user表中
			user.setUsername((String)request.getSession().getAttribute("username"));
			try {
				//将新增用户信息插入到user表中
				userservice.submitinfo(user);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "personalHome";
		}
		
	@RequestMapping("personalHome")
	public String personalHome() {
		return "personalHome";
	}
	@RequestMapping("chatroom")
	public String chatroom() {
		return "chatroom";
	}
	@RequestMapping("participate")
	public String participate() {
		return "participate";
	}
	@RequestMapping("forgot")
	public String forgot() {
		return "forgot";
	}
	@RequestMapping("manage")
	public String manage() {
		return "manage";
	}
}
