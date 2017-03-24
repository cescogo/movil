/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Grupo;
import Modelo.Nota;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Francisco
 */
@WebServlet(name = "servletAcd", urlPatterns = {"/servletAcd"})
public class servletAcd extends HttpServlet {
    
    private Control gestor;
    private int t;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        gestor = new Control();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        switch (request.getParameter("WTRD")) {
            case "login":
                String usu = (String) request.getParameter("usuario");
                String pass = (String) request.getParameter("clave");
                t = gestor.verificaUsuario(usu, pass);
                gestor.verificaUsuario(usu, pass);
                String location = "";
                request.setAttribute("usr", usu);
                if (t == 1) {
                    location = "Admin.jsp";
                }
                if (t == 2) {
                    request.setAttribute("Matri", usu);
                    location = "Matricula.jsp";
                    
                }
                if (t == 3) {
                    nota(request, response);
                    location = "Nota.jsp";
                }
                if (t == 4) {
                    request.setAttribute("Almn", usu);
                    historial(request, response);
                    location = "Historial.jsp";
                }
                response.setContentType("text/html");
                if (!location.isEmpty()) {
                    request.setAttribute("TUSR", t);
                    request.getRequestDispatcher(location).forward(request, response);
                    //response.sendRedirect(location);
                } else {
                    out.println("<html>");
                    out.println("<body><center>");
                    out.println("<h1>Introdusca campos validos</h1>");
                    out.println("<h1><a href='index.jsp'/>volver</h1>");
                    out.print("<input type=button value=volver>");
                    out.println("</center></body></html>");
                }
                break;
            case "historial":
                //request.setAttribute("Almn",request.getParameter("Almn"));
                historial(request, response);
                request.getRequestDispatcher("Historial.jsp").forward(request, response);
                break;
            case "VLVR":
                
                break;
                
            case "lados":
                matriculados(request, response);
                break;
            
        }
    }
    
    private void historial(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Nota> l = new ArrayList<Nota>();
        String Alm = (String) request.getAttribute("Almn");
        gestor.ConsultaHistorial(Alm, l);
        request.setAttribute("historial", l);
    }
    
    private void nota(HttpServletRequest request, HttpServletResponse response) {
        
        ArrayList<Grupo> l = new ArrayList<>();
        gestor.gruposProfe((String) request.getAttribute("usr"), l);
        request.setAttribute("GRPSPRF", l);
    }
    
    private void matriculados(HttpServletRequest request, HttpServletResponse response)
    {
          ArrayList <Nota> l= new ArrayList<Nota>();
                String est=request.getParameter("usuario");
                gestor.matriculados(est, l);
        request.setAttribute("matriculados", l);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
