<%-- 
Document   : AdPersona
Created on : 24/03/2017, 11:43:37 AM
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
    <body><center>

        <% String tad = (String) application.getAttribute("tipAd");%>
        <% String tip = (String) request.getAttribute("act");%>

        <h1>Administracion de <%= tad%></h1>

        <div>
            <form id="wtact" method="post" action="/movil/servletAcd?WTRD=wtact">
                <select name="sltAdmin" form="wtact" onchange="this.form.submit()">
                    <option value="agregar">agregar</option>
                    <option value="actualizar">actualizar</option>
                    <option value="eliminar">eliminar</option>
                    <option value="mostrar">mostrar</option>
                    <c:if test="<%= tad.equals("Profesor") || tad.equals("Alumno")%>" >
                        <option value="mostrarN">mostrar Nombre</option>
                    </c:if>
                    <c:if test="<%= tad.equals("Alumno")%>" >
                        <option value="mostrarC">mostrar Carrera</option>
                    </c:if>
                </select>
            </form>
        </div>
        <c:if test="<%= !tip.equals("0") && !tip.equals("1") %>" >
            <div>
                <form method="post" action="/movil/servletAcd?WTRD=busqADmin?">
                    Ingrese el dato de<%= tad%>:
                    <input type="search" name="busqueda" size="20">
                    <input type="submit" name="busquesb" />
                </form>
            </div>
        </c:if>

        <c:forEach var="pers" items="${Personas}">            
            <table>
                <tr>
                    <td>Identificacion</td>
                    <td><input type="text" size="20" name="id" value="<c:out value="${Hist.cedula}" />"></td>
                </tr>

                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" size="20" name="nombre" value="<c:out value="${Hist.nombre}" />"></td>
                </tr>
                <tr>
                    <td>Telefono</td>
                    <td><input type="text" size="20" name="clave" value="<c:out value="${Hist.telefono}" />"></td>
                </tr>
                <tr>
                    <td>Correo:</td>
                    <td><input type="text" size="20" name="correo" value="<c:out value="${Hist.email}" />"></td>
                </tr>
                <tr>
                    <td>Contraseña:</td>
                    <td><input type="text" size="20" name="clave" value="<c:out value="${Hist.clave}" />"></td>
                </tr>
                <c:if test="<%= tad.equals("Alumno")%>" >
                    <tr>
                        <td>Fecha de Nacimiento</td>
                        <td><input type="text" size="20" name="F_nac" value="<c:out value="${Hist.F_nac}" />"></td>
                    </tr>
                    <tr>
                        <td>Carrera</td>
                        <td><input type="text" size="20" name="carrera" value="<c:out value="${Hist.carrera}" />"></td>
                    </tr>
                </c:if>

            </table> 
        </c:forEach>

        <a href="Admin.jsp" id="atras">atras</a>

    </center>
</body>
</html>
