<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>

<div class="container mt-5 mb-5">
	<c:url value="/common/account/passwordUpdate" var="passwordUpdateControllerUrl"></c:url>
	<form method="post" action="${passwordUpdateControllerUrl }">
		<input name="accountId" value="${accountId }" type="hidden">
		<input name="accountOldPassword" value="${accountOldPassword}" type="hidden">
	  <div class="form-group">
	    <label for="retypeOldPassword">Retype old password:</label>
	    <input class="form-control" id="retypeOldPassword" name="retypeOldPassword" type="password" required>
	  </div>
	  <div class="form-group">
	    <label for="accountNewPassword">New password:</label>
	    <input class="form-control" id="accountNewPassword" name="accountNewPassword" type="password" required>
	  </div> 
	  <div class="form-group">
	    <label for="retypeNewPassword">Retype new password:</label>
	    <input class="form-control" id="retypeNewPassword" name="retypeNewPassword" type="password" required>
	  </div>	  	  	 
	  <button type="submit" class="btn btn-primary">Submit</button>
	  <a class="btn btn-secondary" href="<%=request.getContextPath() %>/common/home">Back</a>
	</form>
</div>
