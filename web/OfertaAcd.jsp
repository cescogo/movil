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
         <form method="post" action="/movil/servletAcd?WTRD=lgout">
            <input type="submit" value="salir" style="float: right">
        </form>
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
                Ingrese numero de Ciclo:
                <input type="text" name="ciclo" size="20"><br>
                <input type="submit" value="confirmar">
            </form>
        </div>

        <table border="1">
            <c:forEach var="Hist" items="${cursos}">
                <thead>
                <th>nombre</th><th>codigo</th><th>creditos</th><th>horas semanales</th>
                </thead>
                <tr>
                    <td><c:out value="${Hist.nombre}" /><p> </td>
                    <td><a href='/movil/servletAcd?WTRD=GRPSCRS&CRS=${Hist.codigo}'/><c:out value="${Hist.codigo}" />  <p> </td>
                    <td> <c:out value="${Hist.creditos}" /> <p> </td>
                    <td>  <c:out value="${Hist.hsemanales}" /><p> </td>
                </tr>
            </c:forEach>
        </table>

        <% String crr = (String)request.getAttribute("CRS"); %>
        <table border="1">
            <c:forEach var="Hist" items="${Grupos}">
                <thead>
                <th>id</th><th>numero</th><th>horario</th><th>id profesor</th>
                </thead>
                <tr>
                    <td><a href='/movil/servletAcd?WTRD=MoAGrp&grp=${Hist.id}&CRSS=<%=crr%>'/> <c:out value="${Hist.id}" /> </td>
                    <td> <c:out value="${Hist.numero}" /><p> </td>
                    <td>  <c:out value="${Hist.horario}" />  <p> </td>
                    <td>  <c:out value="${Hist.profesor}" /> <p> </td>
                </tr>
            </c:forEach>
        </table>

        <c:if test="${Grupos != null }">
            <form action="/movil/servletAcd?WTRD=MoAGrp&grp=?&CRSS=<%=crr%>" method="post">
                <input type="submit" name="agregar" value="agregar"/>
            </form>
        </c:if>

        <c:forEach var="Hist" items="${grups}">        
            <% String as = (String)request.getAttribute("idid"); %>
            <form method="post" action="/movil/servletAcd?WTRD=CHGRP&idid=<%=as%>&CRS=<%=crr%>">
                <table>
                    <tr style="display:<%= (!as.isEmpty())?"blok":"none" %>">
                        <td>codigo</td>
                        <td><input type="text" <%= (as.isEmpty())?"":"readonly" %>  size="20" name="codigo" value="<c:out value="${Hist.id}" />" ></td>
                    </tr>

                    <tr>
                        <td>Numero:</td>
                        <td><input type="text" <%= (as.isEmpty())?"":"readonly" %>  size="20" name="numero" value="<c:out value="${Hist.numero}" />"></td>
                    </tr>
                    <tr>
                        <td>horario:</td>
                        <td><input type="text" size="20" name="horario" value="<c:out value="${Hist.horario}" />"></td>
                    </tr>
                    <tr>
                        <td>profesor:</td>
                        <td><input type="text" size="20" name="profesor" value="<c:out value="${Hist.profesor}" />"></td>
                    </tr>
                    <tr>
                        <td>curso</td>
                        <td><input type="text" readonly size="20" name="curso" value="<c:out value="<%=crr%>" />"></td>
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

