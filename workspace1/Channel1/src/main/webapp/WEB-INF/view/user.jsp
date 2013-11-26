<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
            <h1>User Registration</h1><br/>
	        <form:form method="post" action="userProgram.do" modelAttribute="pro">
	            
	            
	            <table>
	                <tr><td>Name:</td><td><form:input path="name" /></td></tr>
	                <tr><td>Age : </td><td><form:input path="age" /></td></tr>
	                <tr><td>UserName:</td><td><form:input path="username"/></td></tr>
	                <tr><td>Password:</td><td><form:input path="password"/></td></tr>
	                <tr><td colspan="2"><input type="submit" value="Save" /></td></tr>
	            </table>
	        
	        
	        </form:form>
</body>
</html>