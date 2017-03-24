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
    </head>
    <body>
    <center>          
        <% String a = (String) request.getAttribute("Matri");%> 
        <h1>Matriculador <%= a%></h1>
        
        <form method="post" action="/movil/servletAcd?WTRD=lados">
            Ingrese nombre del estudiante:
            <input type="text" name="usuario" size="20">      
           <input type="submit" value="buscar">
        </form>	
        <table border="1">
            <TR>
                <TH> numero grupo </TH>
                <TH> codigo curso </TH>
                
            </TR>
            <c:forEach var="mat" items="${matriculados}">
                <tr>
                    <td> <c:out value="${mat.grupo}" /><p> </td>
                    <td> <c:out value="${mat.CURSO}" /><p> </td>
                   
                </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>
