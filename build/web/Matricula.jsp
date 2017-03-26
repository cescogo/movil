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
        <% String s = ((String)request.getAttribute("style"));%>
         <% String ced = ((String)request.getAttribute("ced"));%>
        <h1>Matriculador <%= a%></h1>
        <form  method="post" action="/movil/servletAcd?WTRD=MDEM">
            Ingrese cedula del estudiante:
            <input type="text" name="usuario" size="20" value = "<%= (ced==null)? "":ced %> " >            
            <input type="submit" value="aceptar">
           
        </form><br>	
          <form method="post" action="/movil/servletAcd?WTRD=matricula" style="visibility :<%= (s != "visible")?"hidden":"visible" %> ">
                Ingrese curso del grupo a matricular :
                <input type="text" name="curso" size="20"><br> <br>        
               Ingrese numero del grupo a matricular :
               <input type="text" name="grupo" size="20"><br>  <br> 
            <input type="submit" value="matricular">
          </form><br>
        <table  id="tabmat" border="1"  style="visibility :<%= (s != "visible")?"hidden":"visible" %> ">
            <TR>
              
                <TH> Codigo Curso </TH>
                <TH> grupo </TH>
                
            </TR>
            <c:forEach var="Hist" items="${matriculados}">
                <tr>
              
                    <td> <c:out value="${Hist.CURSO}" /><p> </td>
                    <td><a href='/movil/servletAcd?WTRD=desmatri&estu=${Hist.ESTUDIANTE}&cur=${Hist.CURSO} '/><c:out value="${Hist.grupo}" /></td>  
                   
                </tr>
            </c:forEach>
        </table>
    </center>
</body>
</html>

</html>
