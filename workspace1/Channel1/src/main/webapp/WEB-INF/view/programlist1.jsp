<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Program List</title>
</head>
<body>
  <center>  
   <b>Program List </b>  
   <form:form method="post" commandName="plo" action="getProgramList1.do">
   
   <table border="1">  
   <tr>  
    <td></td>
    <td class="heading">Program Name</td>  
    <td class="heading">Time</td>    
    </tr>  
   
    <c:forEach var="program" varStatus="loop" items="${programlistItems}" >  
    <tr>
     <td><form:checkbox value="${program}" path="programlist1" /></td>
     <td>${program.programname}</td>  
     <td>${program.time}</td>  
    </tr>  
   
   </c:forEach>
   
   <tr><td colspan="2"><input type="submit" value="Save" /></td></tr>
    
  </table>  
  </form:form>
  
 </center>  
</body>
</html>