<%-- 
    Document   : log
    Created on : 11/03/2017, 10:38:22 PM
    Author     : Francisco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
    <Center>
        <h1>Ingrese los datos correspondientes !</h1>
        <form method="post" action="/movil/servletAcd?WTRD=login">
            Ingrese nombre de usuario:
            <input type="text" name="usuario" size="20"><br>
            Ingrese clave:&nbsp;
            <input type="password" name="clave" size="20"><br>
            <input type="submit" value="confirmar">
        </form>	
    </center>
    </body>
</html>
