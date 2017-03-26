<%-- 
    Document   : AdminProfesores
    Created on : 14/03/2017, 03:52:31 PM
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
        <% String a = (String)application.getAttribute("usr");%>
                <% String s = ((String)request.getAttribute("style"));%>
        <h1>Profesor <%= a%></h1>
        <table id="tb1" style="display:<%= (s != null)?"none":"block" %> " border="1">
            <TR>
                <TH> Curso </TH>
                <TH> Grupo </TH>
            </TR>
            <c:forEach var="Hist" items="${GRPSPRF}">
                <tr>
                    <td> <c:out value="${Hist.curso}" /><p> </td>
                    <td><a href='/movil/servletAcd?WTRD=notas&grp=${Hist.id}'/><c:out value="${Hist.id}" /></td>  
 
                </tr>
            </c:forEach>
        </table>

        <table id="tb2" style="display:<%= (s != null)?s:"none" %> " border="1">
            <TR><TH> Estudiante </TH><TH> Nota </TH></TR>

            <c:forEach var="Hist" items="${notas}">
                <tr>
                    <td> <c:out value="${Hist.ESTUDIANTE}" /><p> </td>

                    <td><form method="post" action="/movil/servletAcd?WTRD=actualizaN&grp=${Hist.grupo}&Est=${Hist.ESTUDIANTE}">
                            <input type="number" name="nota" size="20" value="${Hist.NOTA}"></td> 

                            <td><input type="submit" value="guardar"></form></td>
                </tr>
            </c:forEach>
        </table>

                <a href="/movil/servletAcd?WTRD=nota" style="display:<%= (s != null)?s:"none" %> " value="atras" id="atras">atras</a>
    </center>
    <script>

    </script>

</body>
</html>
