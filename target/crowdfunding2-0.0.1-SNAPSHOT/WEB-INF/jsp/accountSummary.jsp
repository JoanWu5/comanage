<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="<%=basePath%>css/account-summary.css">
    <link rel="stylesheet" href="<%=basePath%>css/font-awesome.css">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
</head>

<body>
	<form action="<%=basePath%>api/account.action" name="accountform" id="accountform" accept-charset="utf-8" method="post">
		<input type="hidden" name="accountId" id="accountId" value=""/>
	    <div class="header">
	        <div class="top-header">
	            <div class="account-box">
	                <div class="abbre-account-name">HQ</div>
	                <div class="login-info">
	                    <p class="welcome-box">
	                        Welcome, ${username }
	                    </p>
	                    <p class="last-login">Last login on 6th July 2018 08:2210</p>
	                </div>
	            </div>
	            <div class="search-box" id="searchaccount">
	                search for your account
	                <span class="fa fa-search"></span>
	            </div>
	        </div>
	        
	        <div class="nav">
	            <div class="cell">
	                <span class="fa fa-home"></span>
	                <p class="desc">overview</p>
	            </div>
	            <div class="cell">
	                <span class="fa fa-cog"></span>
	                <p class="desc">overview</p>
	            </div>
	            <div class="cell">
	                <span class="fa fa-plus-circle"></span>
	                <p class="desc">overview</p>
	            </div>
	            <div class="cell">
	                <span class="fa fa-balance-scale"></span>
	                <p class="desc">overview</p>
	            </div>
	            <div class="cell">
	                <span class="fa fa-phone"></span>
	                <p class="desc">overview</p>
	            </div>
	        </div>
	    </div>
	    <div class="operaters">
	        <div class="operater">
	            Sort Order
	        </div>
	        <div class="operater">
	            Expand/Collapse All
	        </div>
	        <div class="operater">
	            Currency: Account Currency
	        </div>
	    </div>
	    <div class="accordings" id="accordion">
	        <div class="item-wrapper savingGroup">
	            <div class="sup-item" data-toggle="collapse" data-parent="#accordion" href="#collapse1">
	                <span class="fa fa-cog big"></span>
	                <p class="sup-item-title"></p>
	                <span class="fa fa-chevron-down chevron"></span>
	                <span class="fa fa-chevron-up chevron hide"></span>
	                <div class="total-amount-box">
	                    <p class="amount-title">Total Available Amount</p>
	                    <p class="amount"></p>
	                </div>
	            </div>
	            <div id="collapse1" class="sub-items panel-collapse collapse">
	            </div>
	        </div>
			
			
	        <div class="item-wrapper insuranceGroup">
	            <div class="sup-item" data-toggle="collapse" data-parent="#accordion" href="#collapse2">
	                <span class="fa fa-cog big"></span>
	                <p class="sup-item-title"></p>
	                <span class="fa fa-chevron-down chevron"></span>
	                <span class="fa fa-chevron-up chevron hide"></span>
	                <div class="total-amount-box">
	                    <p class="amount-title"></p>
	                    <p class="amount"></p>
	                </div>
	            </div>
	            <div id="collapse2" class="sub-items panel-collapse collapse">
	            </div>
	        </div>
	    </div>
	</form>
	<div class="mask" style="display:none">
        <span class="fa fa-cog fa-spin spinner"></span>
    </div>
</body>
<script>
    $(function () {
        $('.sub-items').on('show.bs.collapse', function () {
            $(this).siblings().children('.fa-chevron-down').addClass("hide");
            $(this).siblings().children('.fa-chevron-up').removeClass("hide");
        })
        $('.sub-items').on('hide.bs.collapse', function () {
            $(this).siblings().children('.fa-chevron-up').addClass("hide");
            $(this).siblings().children('.fa-chevron-down').removeClass("hide");
        })
    });
    
    var accountsFromAPI = '${accounts}';
	var accountsJson = $.parseJSON(accountsFromAPI);
	var savings = accountsJson.accountGroupSummary[0];
	var accountsTitle = savings.accountGroup;
	var accounts = savings.accounts;
	var accountsLenght = savings.accounts.length;
	$(".savingGroup .sup-item-title").text(accountsTitle+"("+accountsLenght+")");
	var savingTotalAmount = savings.totalAvailableBalance.localCurrencyBalanceAmount + " " + savings.totalAvailableBalance.localCurrencyCode;
	$(".savingGroup .amount").text(savingTotalAmount);
	for(var i=0;i<accountsLenght;i++){
		if(accounts[i].savingsAccountSummary != undefined){
			var accountSummary = accounts[i].savingsAccountSummary;
		}else if(accounts[i].callDepositAccountSummary != undefined){
			var accountSummary = accounts[i].callDepositAccountSummary;
		}else if(accounts[i].timeDepositAccountSummary != undefined){
			var accountSummary = accounts[i].timeDepositAccountSummary;
		}else if(accounts[i].premiumDepositAccountSummary != undefined){
			var accountSummary = accounts[i].premiumDepositAccountSummary;
		}else if(accounts[i].mutualFundAccountSummary != undefined){
			var accountSummary = accounts[i].mutualFundAccountSummary;
		}else if(accounts[i].securitiesBrokerageAccountSummary != undefined){
			var accountSummary = accounts[i].securitiesBrokerageAccountSummary;
		}
		var accountId = accountSummary.accountId;
		var productName=accountSummary.productName;
		var displayAccountNumber=accountSummary.displayAccountNumber;
		var balance = accountSummary.currencyCode + " " + accountSummary.availableBalance;
		$("#collapse1").append('<div id="item'+i+'" class="item" onclick="javascript:getAccountDetails(\''+accountId+'\')"><div class="left-info"><div class="account-title"><account-num><account-num></div><div class="account-desc"><account-num></div></div><div class="balance-box"><p class="balance-title">Total Available Amount</p><p class="amount"></div></div>');
		
		$("#item"+i+" .account-title").text(productName);
		$("#item"+i+" account-num").text(displayAccountNumber);
		$("#item"+i+" .amount").text(balance);
	}
	
	//button_get
	//$("#button_get").append('<p class="desc"><button type="button" onclick="javascript:getAccountDetails(\''+accountId+'\')">获取账户信息</button></p>');
	 $("#searchaccount").click(function(){
		 getAccountDetails(accountId);
     })
	var insurances = accountsJson.accountGroupSummary[1];
	var insuranceTitle = insurances.accountGroup;
	var insurancePolicies = insurances.insurancePolicies;
	var insuranceLength = insurances.insurancePolicies.length;
	$(".insuranceGroup .sup-item-title").text(insuranceTitle+"("+insuranceLength+")");
	for(var j=0;j<insuranceLength;j++){
		$("#collapse2").append('<div id="item'+j+'" class="item"><div class="left-info"><div class="account-title"><account-num><account-num></div><div class="account-desc"><account-num></div></div><div class="balance-box"><p class="balance-title">Total Permium Paid Amount</p><p class="amount"></div></div>');
		var productName=insurancePolicies[j].productName;
		var displayAccountNumber=insurancePolicies[j].displayAccountNumber;
		var balance = insurancePolicies[j].currencyCode + " " + insurancePolicies[j].totalPremiumPaidAmount;
		$("#item"+j+" .account-title").text(productName);
		$("#item"+j+" account-num").text(displayAccountNumber);
		$("#item"+j+" .amount").text(balance);
	}
	
	function getAccountDetails(accountId){
		$(".mask").css("display","block");
		document.getElementById("accountId").value = accountId;
		document.getElementById("accountform").submit();
	}
</script>

</html>