<%--
  Created by IntelliJ IDEA.
  User: polin
  Date: 9.03.2024
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String path = request.getParameter("path");
    if (path == null) {
        path = "C:\\";
    }
    File currentDirectory = new File(path);
    String parentDirectoryPath = currentDirectory.getParent();

    if (parentDirectoryPath == null) {
        parentDirectoryPath = "C:\\";
    }
%>
<html>
<head>
    <title>File manager</title>
    <link rel="stylesheet" href="files.css">
</head>
<body>
<h3><%=new Date()%></h3>
<h1><%=path%></h1>
<hr/>
<p>
    <img src="папка%20вверх%20по%20директории.png" alt="">
    <a href=<%="?path=" + parentDirectoryPath%>>Вверх</a>
</p>
<table>
    <tr>
        <td>Файл</td>
        <td>Размер</td>
        <td>Дата</td>
    </tr>
    <%
        File[] directories = (File[]) request.getAttribute("directories");
        for (File directory : directories) {
    %>
    <tr>
        <th>
            <img src="папка.png" alt="">
            <a href="<%="files?path=" + directory.getAbsolutePath()%>"><%=directory.getName() + "/"%></a>
        </th>
        <th></th>
        <th><%=new Date(directory.lastModified())%></th>
    </tr>
    <%}%>
    <%
        File[] files = (File[]) request.getAttribute("files");
        for (File file : files) {
    %>
    <tr>
        <th>
            <img src="файл.png" alt="">
            <a href=<%="download?path=" + file.getAbsolutePath()%>><%=file.getName()%></a>
        </th>
        <th><%=file.length() + " B"%></th>
        <th><%=new Date(file.lastModified())%></th>
    </tr>
    <%}%>
</table>
</body>
</html>
