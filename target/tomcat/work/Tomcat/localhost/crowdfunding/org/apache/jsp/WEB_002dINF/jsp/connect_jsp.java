/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-12 12:51:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class connect_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\r\n");
      out.write("<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\r\n");
      out.write("<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\r\n");
      out.write("<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\r\n");
      out.write("\t<head>\r\n");
      out.write("\t<meta charset=\"utf-8\">\r\n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("\t<title>account sign in</title>\r\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("\t<meta name=\"description\" content=\"Free HTML5 Template by FreeHTML5.co\" />\r\n");
      out.write("\t<meta name=\"keywords\" content=\"free html5, free template, free bootstrap, html5, css3, mobile first, responsive\" />\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("  \t<!-- Facebook and Twitter integration -->\r\n");
      out.write("\t<meta property=\"og:title\" content=\"\"/>\r\n");
      out.write("\t<meta property=\"og:image\" content=\"\"/>\r\n");
      out.write("\t<meta property=\"og:url\" content=\"\"/>\r\n");
      out.write("\t<meta property=\"og:site_name\" content=\"\"/>\r\n");
      out.write("\t<meta property=\"og:description\" content=\"\"/>\r\n");
      out.write("\t<meta name=\"twitter:title\" content=\"\" />\r\n");
      out.write("\t<meta name=\"twitter:image\" content=\"\" />\r\n");
      out.write("\t<meta name=\"twitter:url\" content=\"\" />\r\n");
      out.write("\t<meta name=\"twitter:card\" content=\"\" />\r\n");
      out.write("\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.print(basePath);
      out.write("js/CitiE2E.js\"></script>\r\n");
      out.write("    <script type=\"text/javascript\" src=\"");
      out.print(basePath);
      out.write("js/jquery-2.1.1.min.js\"></script>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(basePath);
      out.write("css/main.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"");
      out.print(basePath);
      out.write("font-awesome-4.7.0/css/font-awesome.min.css\">\r\n");
      out.write("\t<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->\r\n");
      out.write("\t<link rel=\"shortcut icon\" href=\"favicon.ico\">\r\n");
      out.write("\r\n");
      out.write("\t<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>\r\n");
      out.write("\t\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.print(basePath);
      out.write("css/bootstrap.min.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.print(basePath);
      out.write("css/animate.css\">\r\n");
      out.write("\t<link rel=\"stylesheet\" href=\"");
      out.print(basePath);
      out.write("css/style.css\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t<!-- Modernizr JS -->\r\n");
      out.write("\t<script src=\"");
      out.print(basePath);
      out.write("js/modernizr-2.6.2.min.js\"></script>\r\n");
      out.write("\t<!-- FOR IE9 below -->\r\n");
      out.write("\t<!--[if lt IE 9]>\r\n");
      out.write("\t<script src=\"js/respond.min.js\"></script>\r\n");
      out.write("\t<![endif]-->\r\n");
      out.write("\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"container\">\r\n");
      out.write("            <div class=\"copyrights\">Collect from <a href=\"http://www.cssmoban.com/\"  title=\"网站模板\">Comanage</a></div>\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-md-4 col-md-offset-4\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<!-- Start Sign In Form -->\r\n");
      out.write("\t\t\t\t\t<div class=\"fh5co-form animate-box\" data-animate-effect=\"fadeIn\">\r\n");
      out.write("\t\t\t\t\t<form id=\"loginform\" action=\"");
      out.print(basePath);
      out.write("api/login.action\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t\t<h2>Account Sign In</h2>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t<label for=\"username\" class=\"sr-only\">Username</label>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"username\" id=\"username\" placeholder=\"Username\" autocomplete=\"off\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"static_username\" id=\"static_username\" value=\"SandboxUser1\"/>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t<label for=\"password\" class=\"sr-only\">Password</label>\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" class=\"form-control\" name=\"password\" id=\"password\" placeholder=\"Password\" autocomplete=\"off\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"hidden\" name=\"static_password\" id=\"static_password\" value=\"P@ssUser1$\"/>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"mask\" style=\"display:none\">\r\n");
      out.write("\t\t\t\t\t        <span class=\"fa fa-cog fa-spin spinner\"></span>\r\n");
      out.write("\t\t\t\t\t    </div>\r\n");
      out.write("\t\t\t\t\t\t<button id=\"btn1\" class=\"btn btn-primary\" onclick=\"javascript:login()\">Sign in</button>\r\n");
      out.write("\t\t\t\t\t\t\t<div id=\"choiceWindow\">\r\n");
      out.write("            \t\t\t\t\t<label id=\"x\" style=\"position: absolute;top:2px;left: 95%;font-size: 25px;\">x</label>\r\n");
      out.write("               \t\t\t\t\t<form>\r\n");
      out.write("                \t\t\t\t<label>Please choose your participants:</label>&nbsp &nbsp  &nbsp \r\n");
      out.write("                \t\t\t\t<ul class=\"dowebok\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><input type=\"radio\" name=\"radio\" value=\"ID1\">ID1</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><input type=\"radio\" name=\"radio\" value=\"ID2\">ID2</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><input type=\"radio\" name=\"radio\" value=\"ID3\">ID3</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><input type=\"radio\" name=\"radio\" value=\"ID4\">ID4</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><input type=\"radio\" name=\"radio\" value=\"ID5\">ID5</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><input type=\"radio\" name=\"radio\" value=\"ID6\">ID6</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<li><input type=\"radio\" name=\"radio\" value=\"ID7\">ID7</li>\r\n");
      out.write("\t\t\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t\t\t\t<button type=\"button\" value=\"OK\" id=\"ok\">OK</button>\r\n");
      out.write("\t\t\t\t\t\t\t\t</form>\r\n");
      out.write("        \t\t\t\t\t</div>\r\n");
      out.write("        \t\t\t\t\t<div id=\"backGround\"></div>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<!-- END Sign In Form -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t</body>\r\n");
      out.write("\t<!-- jQuery -->\r\n");
      out.write("\t<script src=\"");
      out.print(basePath);
      out.write("js/jquery.min.js\"></script>\r\n");
      out.write("\t<!-- Bootstrap -->\r\n");
      out.write("\t<script src=\"");
      out.print(basePath);
      out.write("js/bootstrap.min.js\"></script>\r\n");
      out.write("\t<!-- Placeholder -->\r\n");
      out.write("\t<script src=\"");
      out.print(basePath);
      out.write("js/jquery.placeholder.min.js\"></script>\r\n");
      out.write("\t<!-- Waypoints -->\r\n");
      out.write("\t<script src=\"");
      out.print(basePath);
      out.write("js/jquery.waypoints.min.js\"></script>\r\n");
      out.write("\t<!-- Main JS -->\r\n");
      out.write("\t<script src=\"");
      out.print(basePath);
      out.write("js/main.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\t<script>\r\n");
      out.write("\t    \r\n");
      out.write("\t\t$(document).ready(function(){\r\n");
      out.write("                $(\"#btn1\").click(function(){\r\n");
      out.write("                    $(\"#choiceWindow\").slideDown(300);\r\n");
      out.write("                    $(\"#backGround\").show();\r\n");
      out.write("\r\n");
      out.write("            });\r\n");
      out.write("\r\n");
      out.write("            $(\"#x\").click(function(){\r\n");
      out.write("                $(\"#choiceWindow\").slideUp(300);\r\n");
      out.write("                $(\"#backGround\").hide();\r\n");
      out.write("            })\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#ok\").click(function(){\r\n");
      out.write("                $(\"#choiceWindow\").slideUp(300);\r\n");
      out.write("                $(\"#backGround\").hide();\r\n");
      out.write("            })\r\n");
      out.write("\r\n");
      out.write("    });\r\n");
      out.write("\t</script>\r\n");
      out.write("\t <script LANGUAGE=JavaScript>\r\n");
      out.write("\t\t\tvar modulus = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${modulus}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("';\r\n");
      out.write("\t\t\tvar exponent = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${exponent}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("';\r\n");
      out.write("\t\t\tvar eventId = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${eventId}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("';\r\n");
      out.write("    \t\t$(\".mask\").css(\"display\",\"none\");\r\n");
      out.write("        </script>\r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("        \t$(\"#password\").bind('keydown',function(event){\r\n");
      out.write("        \t\tif(event.keyCode == \"13\"){\r\n");
      out.write("        \t\t\tlogin();\r\n");
      out.write("        \t\t}\r\n");
      out.write("        \t});\r\n");
      out.write("        \r\n");
      out.write("            function login(){\r\n");
      out.write("            \tvar username = document.getElementById(\"username\").value;\r\n");
      out.write("            \tvar password = document.getElementById(\"password\").value;\r\n");
      out.write("            \t//static_password\r\n");
      out.write("            \tvar static_password = document.getElementById(\"static_password\").value;\r\n");
      out.write("            \t//static_username\r\n");
      out.write("            \tvar static_username = document.getElementById(\"static_username\").value;\r\n");
      out.write("            \t//alert(exponent);\r\n");
      out.write("            \tif(username == null || username == \"\"){\r\n");
      out.write("            \t\talert(\"Please enter your username\");\r\n");
      out.write("            \t}else if(password == null || password == \"\"){\r\n");
      out.write("            \t\talert(\"Please enter your passowrd\");\r\n");
      out.write("            \t}else{\r\n");
      out.write("            \t\t$(\".mask\").css(\"display\",\"block\");\r\n");
      out.write("\t\t\t\t\tvar pub = new RSAKey();\r\n");
      out.write("\t\t\t\t\tpub.setPublic(modulus,exponent);\r\n");
      out.write("\t\t\t\t\tvar unencrypted_data = eventId +\",b\"+static_password;\r\n");
      out.write("\t\t\t\t\t//alert(unencrypted_data);\r\n");
      out.write("\t\t\t\t\tvar encrypted_password = pub.encryptB(getByteArray(unencrypted_data)).toString(16);\r\n");
      out.write("\t\t\t\t\t//alert(encrypted_password);\r\n");
      out.write("            \t\tdocument.getElementById(\"static_password\").value = encrypted_password;\r\n");
      out.write("            \t\tdocument.getElementById(\"loginform\").submit();\r\n");
      out.write("            \t}\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
