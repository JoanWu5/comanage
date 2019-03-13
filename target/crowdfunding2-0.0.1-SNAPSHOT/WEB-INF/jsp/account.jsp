<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Document</title>
<link rel="stylesheet" href="<%=basePath%>css/index.css">
<link rel="stylesheet" href="<%=basePath%>css/account.css">
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.css">
<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>
</head>

<body>
	<form action="<%=basePath%>api/form.action" name="accountDetailForm"
		id="accountDetailForm" accept-charset="utf-8" method="post">
		<input type="hidden" name="jointAccountId" id="jointaccountid" />
		<div class="header">
			<div class="top-header">
				<div class="account-box">
					<div class="abbre-account-name">HQ</div>
					<div class="login-info">
						<p class="welcome-box">Welcome, ${username }</p>
						<p class="last-login">Last login on 6th July 2018 08:2210</p>
					</div>
				</div>
				<div class="search-box">
					search <span class="fa fa-search"></span>
				</div>
			</div>
			<div class="nav">
				<div class="cell">
					<span class="fa fa-home">
					</span>
					<p class="desc">overview</p>
				</div>
				<div class="cell">
					<span class="fa fa-cog">
					</span>
					<p class="desc">Services and Profile</p>
				</div>
				<div class="cell">
					<span class="fa fa-plus-circle">
					</span>
					<p class="desc">Transfers</p>
				</div>
				<div class="cell">
					<span class="fa fa-balance-scale"> </span>
					<p class="desc">Benifits and Products</p>
				</div>
				<div class="cell">
					<span class="fa fa-phone"> </span>
					<p class="desc">Contact Us</p>
				</div>
			</div>
		</div>
		<div class="wrapper-1200 account-details-wrapper">
			<div class="back-to" onclick="javascript:backtoAccountSummary()">
				<span class="fa fa-chevron-left"></span> Back to Submit
			</div>
			<div class="main-info-box">
				<div class="left-info-box">
					<div class="img-box">
						<span class="fa fa-credit-card fa-5x"></span>
					</div>
					<div class="account-currency-type-wrapper">
						<select class="my-select" disabled>
						</select>
						<div class="account-num"></div>
					</div>
					<div class="account-setting">
						<span class="fa fa-cog"></span> Account Setting
					</div>
				</div>
				<div class="right-info-box">
					<p class="balance-title">AVAILABLE BALANCE</p>
					<p class="account-balance"></p>
					<div class="my-button gold small">Transfer/Pay</div>
				</div>
			</div>
			<div class="account-balance">
				Account Balance <span class="bold-txt"></span>
			</div>
			<div class="grey-bg-box">
				<span class="bold-txt">Check how you can get PLN 2,000</span> for a
				Citigold Client referral. <span class="link-txt">More details</span>
			</div>
		</div>
		<div class="wrapper-1200 tansactions-wrapper">
        <div class="transaction-nav">
            <div class="transaction cell active">Transaction</div>
            <div class="onhold cell">On Hold</div>
            <div class="scheduled-transaction cell">Scheduled Transaction</div>
            <div class="clearfix"></div>
        </div>
        <div class="filter-line">
            <div class="cell txt-left">Date</div>
            <div class="cell txt-left">Description</div>
            <div class="search-filter">Search & filter
                <span class="fa fa-search"></span>
            </div>
            <div class="cell txt-center">Amount</div>
            <div class="cell txt-right">Balance</div>
        </div>
        <div class="since-date">
            overdraft usage since <span class="red-txt bold-txt">21 jan 2019</span>
        </div>
        <div class="search-result-wrapper">
        </div>
        
        <div class="result-wrapper">
            Not found any transactions
        </div>
    </div>
	<div class="mask" style="display:none">
        <span class="fa fa-cog fa-spin spinner"></span>
    </div>
</body>

<script>
	function backtoAccountSummary() {
		$(".mask").css("display","block");
		document.getElementById("accountDetailForm").submit();
	}

	var accountDetail = '${accountDetails}';
	var accountsJson = $.parseJSON(accountDetail);
	if (accountsJson.savingsAccount != undefined) {
		accountDetail = accountsJson.savingsAccount;
	} else if (accountsJson.callDepositAccount != undefined) {
		accountDetail = accountsJson.callDepositAccount;
	} else if (accountsJson.timeDepositAccount != undefined) {
		accountDetail = accountsJson.timeDepositAccount;
	} else if (accountsJson.premiumDepositAccount != undefined) {
		accountDetail = accountsJson.premiumDepositAccount;
	} else if (accountsJson.mutualFundAccount != undefined) {
		accountDetail = accountsJson.mutualFundAccount;
	} else if (accountsJson.securitiesBrokerageAccount != undefined) {
		accountDetail = accountsJson.securitiesBrokerageAccount;
	}
	var productName = accountDetail.productName;
	var displayAccountNumber = accountDetail.displayAccountNumber;
	if (accountDetail.availableBalance != undefined) {
		var availableBalance = accountDetail.availableBalance + " "
				+ accountDetail.currencyCode;
	} else if (accountDetail.totalSecuritiesValueAmount != undefined) {
		var availableBalance = accountDetail.totalSecuritiesValueAmount + " "
				+ accountDetail.currencyCode;
	}
	$("select.my-select").append(
			'<option value="'+productName+'">' + productName + '</option>');
	$(".main-info-box .account-num").append(
			displayAccountNumber + ' <span class="fa fa-share-alt"></span>');
	$(".main-info-box .account-balance").text(availableBalance);
	$(".account-balance .bold-txt").text(availableBalance);
	//alert("your jointAccountId is:"+displayAccountNumber+"please remember it and store it in a secure place!");
	document.getElementById("jointaccountid").value = displayAccountNumber;
	
	var transactionDetails = '${transactionDetails}';
	var transactionJson = $.parseJSON(transactionDetails);
	var transactions = transactionJson.transaction;
	if(transactions != undefined){
		var transactionsLength = transactions.length;
		for (var i = 0; i < transactionsLength; i++) {
			var singleTransaction = transactions[i];
			var date = singleTransaction.transactionDate;
			var description = singleTransaction.transactionDescription;
			var amount = singleTransaction.transactionAmount + " " + singleTransaction.currencyCode;
			var balance = singleTransaction.runningBalance;
			$(".search-result-wrapper").append('<div class="result-item result-item'+i+'"><div class="column">'+date+'</div><div class="column desc"><div class="desc-title">'+description+'</div></div><div class="column txt-center bold-txt link-txt">'+amount+'</div><div class="column txt-right">'+balance+'</div></div>');
			$(".result-wrapper").remove();
		}
	}
</script>

</html>