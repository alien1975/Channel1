<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

	        <h1>Program Registration</h1><br/>
	        <form:form method="post" action="channelProgram.do" modelAttribute="pro">
	            
	            
	            <table>
	                <tr><td>Program Name:</td><td><form:input path="programname" /></td></tr>
	                <tr><td>Time : </td><td><form:input path="time" /></td></tr>
	                <tr><td colspan="2"><input type="submit" value="Save" /></td></tr>
	            </table>
	        
	        
	        </form:form>
	    </body>
</body>
</html>
