<%-- 
    Document   : create
    Created on : Oct 30, 2024, 11:07:23 AM
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
        <form action="create" method="POST">
            Name: <input type="text" name="name"/> <br/>
            Phone Number: <input type="text" name="phonenumber"/> <br/>
            Address: <input type="text" name="address"/> <br/>
            Department: <select name="did">
                <c:forEach items="${requestScope.depts}" var="d">
                    <option value="${d.id}">${d.name}</option>
                </c:forEach>
            </select> <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
