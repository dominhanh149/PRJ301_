<%-- 
    Document   : list
    Created on : Oct 27, 2024, 12:11:05 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Production Plan List</title>
    </head>
    <body>
        <table border="1" cellspacing="0" cellpadding="5">
            <thead>
                <tr>
                    <th>Plan Name</th>
                    <th>Start</th>
                    <th>End</th>
                    <th>Product</th>
                    <th>Quantity Expected</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.plans}" var="pl">
                                <tr>
                                    <td>
                                        ${pl.name}
                                    </td>
                                    <td>${pl.start}</td>
                                    <td>${pl.end}</td>
                                    <td>
                                        <c:forEach items="${pl.headers}" var="ph">
                                            ${ph.product.name} </br>
                                        </c:forEach>
                                    </td>
                                    
                                    <td>
                                        <c:forEach items="${pl.headers}" var="ph">
                                            ${ph.quantity} </br>
                                        </c:forEach>
                                    </td>

                                    
                                </tr>
                            </c:forEach>
            </tbody>
        </table>
    </body>
</html>
