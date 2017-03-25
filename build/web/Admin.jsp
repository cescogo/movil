<%-- 
    Document   : AdminAdmin
    Created on : 14/03/2017, 09:39:25 AM
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administradir</title>
    </head>
    <body><center>
slñdfldfsk
        <% String a = (String) application.getAttribute("usr");%>
        
        <h1>Administrador <%= a%></h1>
 
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
            <li> <a href="/movil/servletAcd?WTRD=nota" >Admisntrar Consultar Historial</a> </li>
        </ul>
        </div>
    </center>
</body>
</html>
