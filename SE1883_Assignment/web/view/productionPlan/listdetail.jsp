<%-- 
    Document   : list
    Created on : Oct 31, 2024, 11:02:52 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Plan Detail List</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            /* General body styling */
            body {
                font-family: Arial, sans-serif;
                background-color: #f0f2f5;
                margin: 0;
                padding: 20px;
            }
            
            /* Title styling */
            h1 {
                text-align: center;
                color: #333;
                font-size: 24px;
                margin-bottom: 20px;
            }

            /* Table styling */
            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
            }

            /* Header and cell styling */
            th, td {
                padding: 12px;
                text-align: center;
                border: 1px solid #ddd;
                color: #333;
            }
            
            /* Header background color */
            th {
                background-color: #4CAF50;
                color: white;
                text-transform: uppercase;
                letter-spacing: 0.1em;
            }

            /* Hover effect for rows */
            tr:hover {
                background-color: #f1f1f1;
            }
            
            /* Styling for even rows */
            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            
            /* Hidden input styling (just for clarification) */
            input[type="hidden"] {
                display: none;
            }
        </style>
    </head>
    <body>

        <h1>${requestScope.plan.name}</h1>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Product Name</th>
                    <th>Shift</th>
                    <th>Date</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="detail" items="${details}">
                    <input type="hidden" name="plid" value="${plan.id}" />
                    <tr>
                        <td>${detail.id}</td>
                        <td>${detail.header.product.name}</td>
                        <td>${detail.shift.sname}</td>
                        <td>${detail.date}</td>
                        <td>${detail.quantity}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
    </body>
</html>
