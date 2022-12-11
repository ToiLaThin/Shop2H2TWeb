<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <title>EShopper - Bootstrap Shop Template</title>
	    <meta content="width=device-width, initial-scale=1.0" name="viewport">
	    <meta content="Free HTML Templates" name="keywords">
	    <meta content="Free HTML Templates" name="description">
	
	    <!-- Favicon -->
	    <c:url value="/img/favicon.ico" var="favicon"></c:url>
	    <link href="${favicon }" rel="icon">
	
	    <!-- Google Web Fonts -->
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 
	
	    <!-- Font Awesome -->
	    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
	
	    <!-- Libraries Stylesheet -->
	    <c:url value="/lib/owlcarousel/assets/owl.carousel.min.css" var="style0"></c:url>
	    <link href="${style0}" rel="stylesheet" type="text/css">
	
		<c:url value="/css/style1.css" var="style1"></c:url>
		<!-- Standard Bootstrap Stylesheet -->
	    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <!-- Customized Bootstrap Stylesheet -->
	    <link href="${style1}" rel="stylesheet" type="text/css">
	    
	    <!-- JS AJAX-->	   
		<script src="https://code.jquery.com/jquery-3.6.1.min.js" type="text/javascript"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	</head>
	
	<body>
		<%@ include file="/common/header.jsp"%>​ ​
		<!-- body -->
		<dec:body />
		<!-- body -->
		<!--=== Footer v4 ===-->
		<jsp:include page="/common/footer.jsp"></jsp:include>​
		<!--=== End Footer v4 ===-->
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" type="text/javascript"></script>
		<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" type="text/javascript"></script>	
	</body>
</html>