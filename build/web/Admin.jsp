<%-- 
    Document   : AdminAdmin
    Created on : 14/03/2017, 09:39:25 AM
    Author     : Francisco
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administradir</title>
    </head>
    <body><center>
        <% int shE = Integer.parseInt((String)request.getAttribute("shE"));%>
        <% String a = (String)application.getAttribute("usr");%>
      
        <h1>Administrador <%= a%></h1>

        <c:if test="${shE >= 20}">
            
            <div style="float: start">
                <ul>
                    <li> <a href="/movil/servletAcd?WTRD=admin" >Admisntrar Carreras</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=nota" >Admisntrar cursos</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=adPrf" >Admisntrar profesores</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=adAlm" >Admisntrar Alumnos</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=adDmn" >Admisntrar Administrador</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=adMtr" >Admisntrar Matriculador</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=nota" >Admisntrar Ciclo</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=nota" >Admisntrar Oferta Academica</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=nota" >Admisntrar Matricula</a> </li>
                    <li> <a href="/movil/servletAcd?WTRD=CHis" >Admisntrar Consultar Historial</a> </li>
                </ul>
            </div>
        </c:if>

        <c:if test="${shE <= 2}">
            <div> 
                <form id="cedEst" method="post" action="/movil/servletAcd?WTRD=CHis">
                    <h3>Numero de cedula del Estudiante: </h3>
                    <br>
                    <input type="text" name="idhist" size="12"/>
                    <input type="submit" name="add" value="agregar"/>
                    </form>

            </div>
        </c:if>
    </center>
</body>
</html>
