/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2018-09-08 09:04:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class account_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<title>Document</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(basePath);
      out.write("css/index.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(basePath);
      out.write("css/account.css\">\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.print(basePath);
      out.write("css/font-awesome.css\">\r\n");
      out.write("<script src=\"");
      out.print(basePath);
      out.write("js/jquery-2.1.1.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.print(basePath);
      out.write("js/bootstrap.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\t<form action=\"");
      out.print(basePath);
      out.write("api/form.action\" name=\"accountDetailForm\"\r\n");
      out.write("\t\tid=\"accountDetailForm\" accept-charset=\"utf-8\" method=\"post\">\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"jointAccountId\" id=\"jointaccountid\" />\r\n");
      out.write("\t\t<div class=\"header\">\r\n");
      out.write("\t\t\t<div class=\"top-header\">\r\n");
      out.write("\t\t\t\t<div class=\"account-box\">\r\n");
      out.write("\t\t\t\t\t<div class=\"abbre-account-name\">HQ</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"login-info\">\r\n");
      out.write("\t\t\t\t\t\t<p class=\"welcome-box\">Welcome, ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${username }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</p>\r\n");
      out.write("\t\t\t\t\t\t<p class=\"last-login\">Last login on 6th July 2018 08:2210</p>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"search-box\">\r\n");
      out.write("\t\t\t\t\tsearch <span class=\"fa fa-search\"></span>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"nav\">\r\n");
      out.write("\t\t\t\t<div class=\"cell\">\r\n");
      out.write("\t\t\t\t\t<span class=\"fa fa-home\">\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t<p class=\"desc\">overview</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"cell\">\r\n");
      out.write("\t\t\t\t\t<span class=\"fa fa-cog\">\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t<p class=\"desc\">Services and Profile</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"cell\">\r\n");
      out.write("\t\t\t\t\t<span class=\"fa fa-plus-circle\">\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t\t\t<p class=\"desc\">Transfers</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"cell\">\r\n");
      out.write("\t\t\t\t\t<span class=\"fa fa-balance-scale\"> </span>\r\n");
      out.write("\t\t\t\t\t<p class=\"desc\">Benifits and Products</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"cell\">\r\n");
      out.write("\t\t\t\t\t<span class=\"fa fa-phone\"> </span>\r\n");
      out.write("\t\t\t\t\t<p class=\"desc\">Contact Us</p>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"wrapper-1200 account-details-wrapper\">\r\n");
      out.write("\t\t\t<div class=\"back-to\" onclick=\"javascript:backtoAccountSummary()\">\r\n");
      out.write("\t\t\t\t<span class=\"fa fa-chevron-left\"></span> Back to Submit\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"main-info-box\">\r\n");
      out.write("\t\t\t\t<div class=\"left-info-box\">\r\n");
      out.write("\t\t\t\t\t<div class=\"img-box\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"fa fa-credit-card fa-5x\"></span>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"account-currency-type-wrapper\">\r\n");
      out.write("\t\t\t\t\t\t<select class=\"my-select\" disabled>\r\n");
      out.write("\t\t\t\t\t\t</select>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"account-num\"></div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"account-setting\">\r\n");
      out.write("\t\t\t\t\t\t<span class=\"fa fa-cog\"></span> Account Setting\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"right-info-box\">\r\n");
      out.write("\t\t\t\t\t<p class=\"balance-title\">AVAILABLE BALANCE</p>\r\n");
      out.write("\t\t\t\t\t<p class=\"account-balance\"></p>\r\n");
      out.write("\t\t\t\t\t<div class=\"my-button gold small\">Transfer/Pay</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"account-balance\">\r\n");
      out.write("\t\t\t\tAccount Balance <span class=\"bold-txt\"></span>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"grey-bg-box\">\r\n");
      out.write("\t\t\t\t<span class=\"bold-txt\">Check how you can get PLN 2,000</span> for a\r\n");
      out.write("\t\t\t\tCitigold Client referral. <span class=\"link-txt\">More details</span>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"wrapper-1200 tansactions-wrapper\">\r\n");
      out.write("        <div class=\"transaction-nav\">\r\n");
      out.write("            <div class=\"transaction cell active\">Transaction</div>\r\n");
      out.write("            <div class=\"onhold cell\">On Hold</div>\r\n");
      out.write("            <div class=\"scheduled-transaction cell\">Scheduled Transaction</div>\r\n");
      out.write("            <div class=\"clearfix\"></div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"filter-line\">\r\n");
      out.write("            <div class=\"cell txt-left\">Date</div>\r\n");
      out.write("            <div class=\"cell txt-left\">Description</div>\r\n");
      out.write("            <div class=\"search-filter\">Search & filter\r\n");
      out.write("                <span class=\"fa fa-search\"></span>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"cell txt-center\">Amount</div>\r\n");
      out.write("            <div class=\"cell txt-right\">Balance</div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"since-date\">\r\n");
      out.write("            overdraft usage since <span class=\"red-txt bold-txt\">21 jan 2019</span>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"search-result-wrapper\">\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"result-wrapper\">\r\n");
      out.write("            Not found any transactions\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\t<div class=\"mask\" style=\"display:none\">\r\n");
      out.write("        <span class=\"fa fa-cog fa-spin spinner\"></span>\r\n");
      out.write("    </div>\r\n");
      out.write("</body>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("\tfunction backtoAccountSummary() {\r\n");
      out.write("\t\t$(\".mask\").css(\"display\",\"block\");\r\n");
      out.write("\t\tdocument.getElementById(\"accountDetailForm\").submit();\r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("\tvar accountDetail = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${accountDetails}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("';\r\n");
      out.write("\tvar accountsJson = $.parseJSON(accountDetail);\r\n");
      out.write("\tif (accountsJson.savingsAccount != undefined) {\r\n");
      out.write("\t\taccountDetail = accountsJson.savingsAccount;\r\n");
      out.write("\t} else if (accountsJson.callDepositAccount != undefined) {\r\n");
      out.write("\t\taccountDetail = accountsJson.callDepositAccount;\r\n");
      out.write("\t} else if (accountsJson.timeDepositAccount != undefined) {\r\n");
      out.write("\t\taccountDetail = accountsJson.timeDepositAccount;\r\n");
      out.write("\t} else if (accountsJson.premiumDepositAccount != undefined) {\r\n");
      out.write("\t\taccountDetail = accountsJson.premiumDepositAccount;\r\n");
      out.write("\t} else if (accountsJson.mutualFundAccount != undefined) {\r\n");
      out.write("\t\taccountDetail = accountsJson.mutualFundAccount;\r\n");
      out.write("\t} else if (accountsJson.securitiesBrokerageAccount != undefined) {\r\n");
      out.write("\t\taccountDetail = accountsJson.securitiesBrokerageAccount;\r\n");
      out.write("\t}\r\n");
      out.write("\tvar productName = accountDetail.productName;\r\n");
      out.write("\tvar displayAccountNumber = accountDetail.displayAccountNumber;\r\n");
      out.write("\tif (accountDetail.availableBalance != undefined) {\r\n");
      out.write("\t\tvar availableBalance = accountDetail.availableBalance + \" \"\r\n");
      out.write("\t\t\t\t+ accountDetail.currencyCode;\r\n");
      out.write("\t} else if (accountDetail.totalSecuritiesValueAmount != undefined) {\r\n");
      out.write("\t\tvar availableBalance = accountDetail.totalSecuritiesValueAmount + \" \"\r\n");
      out.write("\t\t\t\t+ accountDetail.currencyCode;\r\n");
      out.write("\t}\r\n");
      out.write("\t$(\"select.my-select\").append(\r\n");
      out.write("\t\t\t'<option value=\"'+productName+'\">' + productName + '</option>');\r\n");
      out.write("\t$(\".main-info-box .account-num\").append(\r\n");
      out.write("\t\t\tdisplayAccountNumber + ' <span class=\"fa fa-share-alt\"></span>');\r\n");
      out.write("\t$(\".main-info-box .account-balance\").text(availableBalance);\r\n");
      out.write("\t$(\".account-balance .bold-txt\").text(availableBalance);\r\n");
      out.write("\t//alert(\"your jointAccountId is:\"+displayAccountNumber+\"please remember it and store it in a secure place!\");\r\n");
      out.write("\tdocument.getElementById(\"jointaccountid\").value = displayAccountNumber;\r\n");
      out.write("\t\r\n");
      out.write("\tvar transactionDetails = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${transactionDetails}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("';\r\n");
      out.write("\tvar transactionJson = $.parseJSON(transactionDetails);\r\n");
      out.write("\tvar transactions = transactionJson.transaction;\r\n");
      out.write("\tif(transactions != undefined){\r\n");
      out.write("\t\tvar transactionsLength = transactions.length;\r\n");
      out.write("\t\tfor (var i = 0; i < transactionsLength; i++) {\r\n");
      out.write("\t\t\tvar singleTransaction = transactions[i];\r\n");
      out.write("\t\t\tvar date = singleTransaction.transactionDate;\r\n");
      out.write("\t\t\tvar description = singleTransaction.transactionDescription;\r\n");
      out.write("\t\t\tvar amount = singleTransaction.transactionAmount + \" \" + singleTransaction.currencyCode;\r\n");
      out.write("\t\t\tvar balance = singleTransaction.runningBalance;\r\n");
      out.write("\t\t\t$(\".search-result-wrapper\").append('<div class=\"result-item result-item'+i+'\"><div class=\"column\">'+date+'</div><div class=\"column desc\"><div class=\"desc-title\">'+description+'</div></div><div class=\"column txt-center bold-txt link-txt\">'+amount+'</div><div class=\"column txt-right\">'+balance+'</div></div>');\r\n");
      out.write("\t\t\t$(\".result-wrapper\").remove();\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</html>");
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