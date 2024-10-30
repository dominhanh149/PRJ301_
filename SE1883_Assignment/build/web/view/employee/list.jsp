<%-- 
    Document   : list
    Created on : Oct 30, 2024, 11:07:05 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee List</title>
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
                width: 80%;
                margin: 0 auto;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                overflow: hidden;
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
            .action-buttons {
                display: flex;
                gap: 10px;
            }
            input[type="button"], a {
                padding: 10px 15px;
                background-color: #4CAF50;
                color: white;
                text-decoration: none;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
            }
            input[type="button"]:hover, a:hover {
                background-color: #45a049;
            }
            form {
                display: inline;
            }
        </style>
        <script>
            function removeEmployee(id) {
                var result = confirm("Are you sure?");
                if (result) {
                    document.getElementById("formRemove" + id).submit();
                }
            }
        </script>
    </head>
    <body>
        <h1>Employee List</h1>
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.emps}" var="e">
                    <tr>
                        <td>${e.id}</td>
                        <td>${e.name}</td>
                        <td>${e.phoneNumber}</td>
                        <td>${e.address}</td>
                        <td class="action-buttons">
                            <a href="update?id=${e.id}">Edit</a>
                            <input type="button" value="Remove" onclick="removeEmployee(${e.id})"/>
                            <form id="formRemove${e.id}" action="delete" method="POST"> 
                                <input type="hidden" name="id" value="${e.id}"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
