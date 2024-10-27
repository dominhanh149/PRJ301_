<%-- 
    Document   : list
    Created on : Oct 27, 2024, 12:11:05 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid mt-4">
            <div class="header">
                <input class="back-btn" type="button" value="Back"/>
                <input class="create-btn" type="button" value="Create" onclick="redirectToCreate();"/>
                <h1>Production Plan List</h1>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="main-content">
                        <table class="table">
                            <tr>
                                <td style="font-weight: bold">Plan Name</td>
                                <td style="font-weight: bold">Start</td>
                                <td style="font-weight: bold">End</td>
                                <td style="font-weight: bold">Product</td>
                                <td style="font-weight: bold">Quantity Produced</td>
                                <td style="font-weight: bold">Quantity Expected</td>
                                <td></td>
                            </tr>

                            <c:forEach items="${requestScope.plans}" var="pl">
                                <tr>
                                    <td>
                                        <a id="plname" href="detail?plid=${pl.id}">${pl.name}</a>
                                    </td>
                                    <td>${pl.start}</td>
                                    <td>${pl.end}</td>
                                    <td>
                                        <c:forEach items="${pl.headers}" var="ph">
                                            ${ph.product.pname} </br>
                                        </c:forEach>
                                    </td>
                                    <td>Quantity Produced</td>
                                    <td>
                                        <c:forEach items="${pl.headers}" var="ph">
                                            ${ph.quantity} </br>
                                        </c:forEach>
                                    </td>

                                    <td>
                                        <a href="update?plid=${pl.id}" id="option" class="edit-btn">Edit</a>
                                        <a href="delete?plid=${pl.id}" id="option" class="delete-btn" onclick="return confirmDelete(${pl.id}, '${pl.name}')">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <script>
            function redirectToCreate() {
                window.location.href = 'create'; // Đường dẫn đến trang đích
            };

            function confirmDelete(plid, plname) {
                return confirm("Are you sure you want to delete plan: " + plname);
            };
        </script>
    </body>
</html>
