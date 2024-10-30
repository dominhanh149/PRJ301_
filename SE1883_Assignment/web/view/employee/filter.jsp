<%-- 
    Document   : filter
    Created on : Oct 30, 2024, 11:07:34 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="filter" method="GET"> 
            Id: <input type="text" name="id" value="${param.id}"/> <br/>
            Name: <input type="text" name="name" value="${param.name}"/> <br/>
            Phone Number: <input type="text" name="phonenumber" value="${param.phonenumber}"/> <br/>
            Address: <input type="text" name="address" value="${param.address}"/> <br/>
            Department: <select name="did">
                <option value="-1">--------------ALL--------------</option>
                <c:forEach items="${requestScope.depts}" var="d">
                    <option 
                        ${param.did ne null and param.did eq d.id ?"selected=\"selected\"":""}
                        value="${d.id}">${d.name}</option>
                </c:forEach>
            </select> 
            <br/>
            <input type="submit" value="Search"/>
        </form>
        <table border="1px">
            <tr>
                <td>Id</td>
                <td>Name</td>
                <td>Phone Number</td>    
                <td>Address</td>
                <td>Department</td>
            </tr>
            <c:forEach items="${requestScope.emps}" var="e">
             <tr>
                <td>${e.id}</td>
                <td>${e.name}</td>
                <td>${e.phoneNumber}</td>
                <td>${e.address}</td>
                <td>${e.dept.name}</td>
            </tr>   
            </c:forEach>
        </table>
    </body>
</html>