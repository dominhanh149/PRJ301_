<%-- 
    Document   : createdetail
    Created on : Nov 1, 2024, 12:04:41 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Create Plan Detail</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
            }
            form {
                max-width: 400px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            label, input, select {
                display: block;
                width: 100%;
                margin-bottom: 10px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 10px;
                cursor: pointer;
                border-radius: 4px;
            }
        </style>
    </head>
    <body>
        <h1>Create Plan Detail</h1>

        <form action="create" method="post">
            <input type="hidden" name="plid" value="${plan.id}" />

            <label for="header">Product Header</label>
            <select name="header" required>
                <c:forEach items="${headers}" var="header">
                    <option value="${header.id}">${header.plan.name}</option>
                </c:forEach>
            </select>

            <label for="shift">Shift</label>
            <select name="shift" required>
                <option value="1">K1</option>
                <option value="2">K2</option>
                <option value="3">K3</option>
            </select>

            <label for="date">Date</label>
            <input type="date" name="date" required />

            <label for="quantity">Quantity</label>
            <input type="number" name="quantity" required />

            <input type="submit" value="Save" />
        </form>
    </body>
</html>
