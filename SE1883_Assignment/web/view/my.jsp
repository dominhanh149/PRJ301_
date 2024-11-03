<%-- 
    Document   : my
    Created on : Nov 3, 2024, 9:07:07 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tlds/customtags.tld" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formatted Date Example</title>
</head>
<body>
    <h1>Formatted Date:</h1>
    <mytag:DateTag value="${requestScope.data}" />
</body>
</html>