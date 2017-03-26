<%-- 
    Document   : AdminAlumno
    Created on : 14/03/2017, 03:53:38 PM
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <form method="post" action="/movil/servletAcd?WTRD=lgout">
            <input type="submit" value="salir" style="float: right">
        </form>
    </head>
    <body>
    <center>          
        <% String a = (String) request.getAttribute("Almn");%> 
        <% String tusr = (String) application.getAttribute("TUSR");%> 
        
        <h1>Estudiante <%= a%></h1>
        <table border="1">
            <TR>
                <TH> Curso </TH>
                <TH> Grupo </TH>
                <TH> Nota </TH>
                <TH> Condicion</TH>
            </TR>
            <c:forEach var="Hist" items="${historial}">
                <tr>
                    <td> <c:out value="${Hist.CURSO}" /><p> </td>
                    <td> <c:out value="${Hist.grupo}" /><p> </td>
                    <td> <c:out value="${Hist.NOTA}" /><p> </td>
                    <td> <c:out value="${Hist.condision}" /><p> </td>
                </tr>
            </c:forEach>
        </table>
                <c:if test="<%= tusr.equals("1")%>" >
                 <a href="/movil/servletAcd?WTRD=VLVR" id="atras">administrador </a>
                </c:if>
    </center>
</body>
</html>
