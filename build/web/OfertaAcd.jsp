<%-- 
    Document   : Dtsfrm
    Created on : 24/03/2017, 12:45:48 PM
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
        <% String a = (String) application.getAttribute("usr");%>
        <% String f = (String) request.getAttribute("frt");%>
        <h1>Administrador <%= a%></h1>
        <br>       

        <div>
            <form method="post" action="/movil/servletAcd?WTRD=CnfCar">
                Ingrese Codigo de Carrera:
                <input type="text" name="carrera" size="20"><br>
                <input type="submit" value="confirmar">
            </form>
        </div>

        <table border="1">
            <c:forEach var="Hist" items="${cursos}">
                <tr>
                    <td><c:out value="${Hist.nombre}" /><p> </td>
                    <td><a href='/movil/servletAcd?WTRD=GRPSCRS&CRS=${Hist.codigo}'/><c:out value="${Hist.codigo}" />  <p> </td>
                    <td> <c:out value="${Hist.creditos}" /> <p> </td>
                    <td>  <c:out value="${Hist.hsemanales}" /><p> </td>
                </tr>
            </c:forEach>
        </table>

        <table border="1">
            <c:forEach var="Hist" items="${Grupos}">
                <tr>
                    <td><a href='/movil/servletAcd?WTRD=MoAGrp&grp=${Hist.id}'/> <c:out value="${Hist.id}" /> </td>
                    <td> <c:out value="${Hist.numero}" /><p> </td>
                    <td>  <c:out value="${Hist.horario}" />  <p> </td>
                    <td>  <c:out value="${Hist.profesor}" /> <p> </td>
                </tr>
            </c:forEach>
        </table>

        <c:if test="${Grupos != null }">
            <form action="/movil/servletAcd?WTRD=MoAGrp&grp=?" method="post">
                <input type="submit" name="agregar" value="agregar"/>
            </form>
        </c:if>

        <c:forEach var="Hist" items="${grups}">        
            <% String as = (String)request.getAttribute("idid"); %>
            <form method="post" action="/movil/servletAcd?WTRD=CHGRP">
                <table>
                    <tr style="display:<%= (!as.isEmpty())?"blok":"none" %>">
                        <td>Identificacion</td>
                        <td><input type="text" <%= (as.isEmpty())?"":"readonly" %>  size="20" name="cedula" value="<c:out value="${Hist.id}" />" ></td>
                    </tr>

                    <tr>
                        <td>Numero:</td>
                        <td><input type="text" <%= (as.isEmpty())?"":"readonly" %>  size="20" name="nombre" value="<c:out value="${Hist.numero}" />"></td>
                    </tr>
                    <tr>
                        <td>horario:</td>
                        <td><input type="text" size="20" name="telefono" value="<c:out value="${Hist.horario}" />"></td>
                    </tr>
                    <tr>
                        <td>profesor:</td>
                        <td><input type="text" size="20" name="correo" value="<c:out value="${Hist.profesor}" />"></td>
                    </tr>
                    <tr>
                        <td>curso</td>
                        <td><input type="text" <%= (as.isEmpty())?"":"readonly" %> size="20" name="clave" value="<c:out value="${Hist.curso}" />"></td>
                    </tr>
                    <br><hr>
                </table> 

                <input type="submit" name="act" value="enviar"/>

                <br><hr>
            </form>
        </c:forEach>


        <a href="OfertaAcd.jsp" id="atras">inicio </a><hr>
        <a href="Admin.jsp" id="atras">administrador </a>

    </center>
    <script>

    </script>

</body>
</html>

