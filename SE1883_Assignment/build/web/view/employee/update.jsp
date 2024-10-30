<%-- 
    Document   : update
    Created on : Oct 30, 2024, 11:07:28 AM
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
        <form action="update" method="POST">
                Id:${requestScope.e.id} <br/>
            <input type="hidden" name="id" value="${requestScope.e.id}"/>
            Name: <input type="text" name="name" value="${requestScope.e.name}"/> <br/>
            Phone Number: <input type="text" name="phonenumber" value="${requestScope.e.phoneNumber}"/> <br/>
            Address: <input type="text" name="address" value="${requestScope.e.address}"/> <br/>
            Department: <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option 
                        ${requestScope.e.dept.id eq d.id?"selected=\"selected\"":""}
                        value="${d.id}">${d.name}</option>
                </c:forEach>
            </select> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
