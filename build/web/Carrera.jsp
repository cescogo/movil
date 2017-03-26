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
        <% String tad = (String) application.getAttribute("tipAd");%>
        <% String tip = (String) request.getAttribute("act");%>
         <form method="post" action="/movil/servletAcd?WTRD=lgout">
            <input type="submit" value="salir" style="float: right">
        </form>
    <body ><center>


        <h1>Administracion de <%= tad%></h1>

        <div>
            <form id="wtact" method="post" action="/movil/servletAcd?WTRD=wtact&CJA=C">
                <select name="sltAdmin" form="wtact" onchange="this.form.submit()">
                    <option value="noda">___</option>
                    <option value="agregar">agregar</option>
                    <option value="actualizar">actualizar</option>
                    <option value="eliminar">eliminar</option>
                    <option value="mostrar">mostrar</option>
                    <option value="mostrarN">mostrar Nombre</option>
                    <c:if test="<%= tad.equals("Curso")%>" >
                        <option value="mostrarC">mostrar Carrera</option>
                    </c:if>
                </select>
            </form>
        </div>
        <c:if test="<%= !tip.equals("0") && !tip.equals("1")%>" >
            <div>
                <form method="post" action="/movil/servletAcd?WTRD=busqCar&intslt=<%= tip%>">
                    Ingrese el dato de<%= tad%>:
                    <input type="search" name="busqueda" size="20">
                    <input type="submit" name="busquesb" />
                </form>
            </div>
        </c:if>

        <c:forEach var="Hist" items="${Carreras}">        

            <form method="post" action="/movil/servletAcd?WTRD=agregaCar&intslt=<%= tip%>">
                <table>
                    <tr>
                        <td>codigo</td>
                        <td><input type="text" size="20" name="codigo" value="<c:out value="${Hist.codigo}" />" <%= (tip.equals("1")) ? " " : "readonly"%>></td>
                    </tr>

                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" size="20" name="nombre" value="<c:out value="${Hist.nombre}" />" <%= (tip.equals("1")||tip.equals("2")) ? " " : "readonly"%>></td>
                    </tr>
                    <br><hr>
                </table> 
                <c:if test="<%= tip.equals("1")%>" >
                    <input type="submit" name="add" value="agregar"/>
                </c:if>
                <c:if test="<%= tip.equals("2")%>" >
                    <input type="submit" name="act" value="actualizar"/>
                </c:if>
                <br><hr>
            </form>
        </c:forEach>

        <c:forEach var="Hist" items="${Cursos}">        

            <form method="post" action="/movil/servletAcd?WTRD=agregaCar&intslt=<%= tip%>">
                <table>
                    <tr>
                        <td>codigo</td>
                        <td><input type="text" size="20" name="codigo" value="<c:out value="${Hist.codigo}" />" <%= (tip.equals("1")) ? " " : "readonly"%>></td>
                    </tr>

                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" size="20" name="nombre" value="<c:out value="${Hist.nombre}" />" <%= (tip.equals("1")||tip.equals("2")) ? " " : "readonly"%>></td>
                    </tr>
                    <tr>
                        <td>creditos</td>
                        <td><input type="text" size="20" name="creditos" value="<c:out value="${Hist.creditos}" />" <%= (tip.equals("1")||tip.equals("2")) ? " " : "readonly"%>></td>
                    </tr>
                    <tr>
                        <td>hsemanales</td>
                        <td><input type="text" size="20" name="hsemanales" value="<c:out value="${Hist.hsemanales}" />" <%= (tip.equals("1")||tip.equals("2")) ? " " : "readonly"%>></td>
                    </tr>
                    <tr>
                        <td>num_ciclo</td>
                        <td><input type="text" size="20" name="num_ciclo" value="<c:out value="${Hist.num_ciclo}" />" <%= (tip.equals("1")||tip.equals("2")) ? " " : "readonly"%>></td>
                    </tr>
                     <tr>
                            <td>Carrera</td>
                            <td><input type="text" size="20" name="carrera" value="<c:out value="${Hist.carrera}" />" <%= (tip.equals("1")) ? " " : "readonly"%>></td>
                    </tr>
                   
                    <br><hr>
                </table> 
                <c:if test="<%= tip.equals("1")%>" >
                    <input type="submit" name="add" value="agregar"/>
                </c:if>
                <c:if test="<%= tip.equals("2")%>" >
                    <input type="submit" name="act" value="actualizar"/>
                </c:if>
                <br><hr>
            </form>
        </c:forEach>

        <a href="Admin.jsp" id="atras">atras</a>

    </center>
</body>
</html>
