<%-- 
    Document   : AdminProfesores
    Created on : 14/03/2017, 03:52:31 PM
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>          
        <% String a = (String) request.getAttribute("usr");%> 
        <h1>Profesor <%= a%></h1>
        <table border="1">
            <TR>
                <TH> Curso </TH>
                <TH> Grupo </TH>
                <TH> Nota </TH>
                <TH> Condicion</TH>
            </TR>
            <c:forEach var="Hist" items="${GRPSPRF}">
                <tr>
                <td> <c:out value="${Hist.CURSO}" /><p> </td>
                <td> <c:out value="${Hist.grupo}" /><p> </td>
                <td> <c:out value="${Hist.NOTA}" /><p> </td>
                <td> <c:out value="${Hist.condision}" /><p> </td>
                    </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>
