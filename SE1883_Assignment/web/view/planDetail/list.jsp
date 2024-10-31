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
            table {
                width: 100%;
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h1>${requestScope.plan.name}</h1>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Product</th>
                    <th>Shift K1</th>
                    <th>Shift K2</th>
                    <th>Shift K3</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="date" items="${dateList}">
                    <tr>
                        <td>${date}</td>
                        <!-- Thêm input ẩn để gửi plid -->
                <input type="hidden" name="plid" value="${plan.id}"/>
                <input type="hidden" name="dateRange" value="${date}"/>
                <c:forEach items="${plan.headers}" var="head">
                    <td>
                        <!-- Shift 1 (K1) -->
                        <c:set var="shift1Quantity" value="0"/>
                        <c:forEach var="detail" items="${head.details}">
                            <c:if test="${detail.date == date && detail.shift.sname == 'K1'}">
                                <c:set var="shift1Quantity" value="${detail.quantity}"/>
                            </c:if>
                        </c:forEach>
                        <input type="text" name="shift1_quantity_${date}_${head.product.pname}" value="${shift1Quantity}"/>
                    </td>
                    <td>
                        <!-- Shift 2 (K2) -->
                        <c:set var="shift2Quantity" value="0"/>
                        <c:forEach var="detail" items="${head.details}">
                            <c:if test="${detail.date == date && detail.shift.sname == 'K2'}">
                                <c:set var="shift2Quantity" value="${detail.quantity}"/>
                            </c:if>
                        </c:forEach>
                        <input type="text" name="shift2_quantity_${date}_${head.product.pname}" value="${shift2Quantity}"/>
                    </td>
                    <td>
                        <!-- Shift 3 (K3) -->
                        <c:set var="shift3Quantity" value="0"/>
                        <c:forEach var="detail" items="${head.details}">
                            <c:if test="${detail.date == date && detail.shift.sname == 'K3'}">
                                <c:set var="shift3Quantity" value="${detail.quantity}"/>
                            </c:if>
                        </c:forEach>
                        <input type="text" name="shift3_quantity_${date}_${head.product.pname}" value="${shift3Quantity}"/>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>

    </tbody>
</table>
</body>
</html>
