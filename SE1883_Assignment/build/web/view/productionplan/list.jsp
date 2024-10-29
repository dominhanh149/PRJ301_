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
        <link rel="stylesheet" href="styles.css">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
            }
            h1 {
                text-align: center;
                color: #333;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #4CAF50;
                color: white;
                text-transform: uppercase;
                letter-spacing: 0.1em;
            }
            tr:hover {
                background-color: #f1f1f1;
            }
            td {
                color: #333;
            }
            .product-list, .quantity-list {
                line-height: 1.6;
            }
        </style>
        <script>
            function redirectToCreatePlan() {
                window.location.href = 'create';
            }
            function confirmDelete(planId) {
                if (confirm("Are you sure you want to delete this plan?")) {
                    window.location.href = 'deleteProductPlan?planId=' + planId;
                }
            }
        </script>
    </head>
    <body>
        <h1>Production Plan List</h1>
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
                                    <td>
                                        <a href="update?plid=${pl.id}">Update</a>
                                        <a href="delete?plid=${pl.id}" onclick="confirmDelete(${pl.id});">Delete</a>
                                    </td>
                                    
                                </tr>
                            </c:forEach>
            </tbody>
        </table>
        <div style="text-align: center; margin-top: 20px;">
            <button onclick="redirectToCreatePlan()" style="padding: 10px 20px; background-color: #4CAF50; color: white; border: none; cursor: pointer;">
                    Create New Plan
                </button>
        </div>
    </body>
</html>
