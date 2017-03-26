<%-- 
    Document   : AdminMatriculador
    Created on : 14/03/2017, 03:53:10 PM
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
        <% String a = (String)application.getAttribute("usr");%> 
        <h1>Matriculador <%= a%></h1>
        <form method="post" action="/movil/servletAcd?WTRD=MDEM">
            Ingrese cedula del estudiante:
            <input type="text" name="usuario" size="20">            
            <input type="submit" value="aceptar">
        </form>	
        <table border="1">
            <TR>
              <!--  <TH> Nombre Curso </TH> -->
                <TH> Codigo Curso </TH>
                <TH> grupo </TH>
                
            </TR>
            <c:forEach var="Hist" items="${matriculados}">
                <tr>
                  <!-- <td> <c:out value=" " /><p> </td> -->
                    <td> <c:out value="${Hist.CURSO}" /><p> </td>
                    <td> <c:out value="${Hist.grupo}" /><p> </td>
                   
                </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>

</html>
