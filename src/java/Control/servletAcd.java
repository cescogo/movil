/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.Administrador;
import Modelo.Alumno;
import Modelo.Carrera;
import Modelo.Curso;
import Modelo.Grupo;
import Modelo.Matriculador;
import Modelo.Nota;
import Modelo.Persona;
import Modelo.Profesor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jvnet.staxex.util.FinalArrayList;

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
            case "lgout":
                 getServletContext().removeAttribute("usr");
                 getServletContext().setAttribute("usr", null);
                 request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
            case "login":
                String usu = (String) request.getParameter("usuario");
                String pass = (String) request.getParameter("clave");
                t = gestor.verificaUsuario(usu, pass);
                gestor.verificaUsuario(usu, pass);
                String location = "";
                getServletContext().setAttribute("usr", usu);
//                request.getSession().setAttribute("usr", usu);
//                request.setAttribute("usr", usu);
                if (t == 1) {
                    getServletContext().setAttribute("shE", "20");
                    location = "Admin.jsp";
                }
                if (t == 2) {
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
                     getServletContext().setAttribute("TUSR", ""+t);
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
            case "CHis":
                if (request.getParameter("idhist") == null) {
                    getServletContext().setAttribute("shE", "2");
                    request.getRequestDispatcher("Admin.jsp").forward(request, response);
                    break;
                } else {
                    request.setAttribute("Almn", request.getParameter("idhist"));
                }

            case "historial":
                //request.setAttribute("Almn",request.getParameter("Almn"));
                historial(request, response);
                request.getRequestDispatcher("Historial.jsp").forward(request, response);
                break;
            case "VLVR":
                getServletContext().setAttribute("shE", "20");
                request.getRequestDispatcher("Admin.jsp").forward(request, response);

                break;
            case "agregaPer":
                Persona ax = null;
                switch ((String) getServletContext().getAttribute("tipAd")) {
                    case "Alumno":
                        ax = new Alumno(Integer.parseInt(request.getParameter("telefono")), (String) request.getParameter("correo"), (String) request.getParameter("nombre"), (String) request.getParameter("cedula"), (String) request.getParameter("F_nac"), (String) request.getParameter("clave"), (String) request.getParameter("carrera"));
                        break;
                    case "Profesor":
                        ax = new Profesor(Integer.parseInt(request.getParameter("telefono")), (String) request.getParameter("correo"), (String) request.getParameter("nombre"), (String) request.getParameter("cedula"), (String) request.getParameter("clave"));
                        break;
                    case "Administrador":
                        ax = new Administrador(Integer.parseInt(request.getParameter("telefono")), (String) request.getParameter("correo"), (String) request.getParameter("nombre"), (String) request.getParameter("cedula"), (String) request.getParameter("clave"));
                        break;
                    case "Matriculador":
                        ax = new Matriculador(Integer.parseInt(request.getParameter("telefono")), (String) request.getParameter("correo"), (String) request.getParameter("nombre"), (String) request.getParameter("cedula"), (String) request.getParameter("clave"));
                        break;
                    default:
                        break;
                }
                if (((String) request.getParameter("intslt")).equals("2")) {
                    gestor.actualizaP(ax);
                } else {
                    gestor.agregarP(ax);
                }
                request.setAttribute("act", "0");
                request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                break;
            case "agregaCar":
                Carrera aa = null;
                Curso x = null;
                if (((String) getServletContext().getAttribute("tipAd")).equals("Carrera")) {
                    aa = new Carrera((String) request.getParameter("nombre"), (String) request.getParameter("codigo"));
                } else {
                    x = new Curso((String) request.getParameter("codigo"), (String) request.getParameter("nombre"), Integer.parseInt((String) request.getParameter("creditos")), Integer.parseInt((String) request.getParameter("hsemanales")), (String) request.getParameter("carrera"), Integer.parseInt((String) request.getParameter("num_ciclo")));
                }

                if (((String) request.getParameter("intslt")).equals("2")) {
                    if (((String) getServletContext().getAttribute("tipAd")).equals("Carrera")) {
                        gestor.ActualizarCarrera(aa);
                    } else {
                        gestor.ActualizarCurso(x);
                    }
                } else if (((String) getServletContext().getAttribute("tipAd")).equals("Carrera")) {
                    gestor.agregarCarrera(aa.getNombre(), aa.getCodigo());
                } else {
                    gestor.agregarCurso(x.getCodigo(), x.getNombre(), x.getCreditos(), x.getHsemanales(), x.getCarrera(), x.getNum_ciclo());
                }
                request.setAttribute("act", "0");
                request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                break;

            case "wtact":
                String a = (String) request.getParameter("sltAdmin");
                switch (a) {
                    case "agregar":
                        String sas = (String) getServletContext().getAttribute("tipAd");
                        if (sas.equals("Carrera")) {
                            ArrayList<Carrera> l = new ArrayList();
                            l.add(new Carrera());
                            request.setAttribute("Carreras", l);
                        } else if (sas.equals("Curso")) {
                            ArrayList<Curso> l = new ArrayList();
                            l.add(new Curso());
                            request.setAttribute("Cursos", l);
                        } else {
                            ArrayList<Persona> l = new ArrayList();
                            l.add(new Alumno());
                            request.setAttribute("Personas", l);
                        }

                        request.setAttribute("act", "1");
                        break;
                    case "actualizar":
                        request.setAttribute("act", "2");
                        break;
                    case "eliminar":
                        request.setAttribute("act", "3");
                        break;
                    case "mostrar":
                        request.setAttribute("act", "4");
                        break;
                    case "mostrarN":
                        request.setAttribute("act", "5");
                        break;
                    case "mostrarC":
                        request.setAttribute("act", "6");
                        break;
                    default:
                        request.setAttribute("act", "0");
                        break;

                }
                if (((String) request.getParameter("CJA")).equals("C")) {
                    request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                }
                request.getRequestDispatcher("AdPersona.jsp").forward(request, response);

                break;
            case "adCar":
                getServletContext().setAttribute("tipAd", "Carrera");
                request.setAttribute("act", "0");
                request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                break;
            case "adCur":
                getServletContext().setAttribute("tipAd", "Curso");
                request.setAttribute("act", "0");
                request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                break;
            case "adPrf":
                getServletContext().setAttribute("tipAd", "Profesor");
                request.setAttribute("act", "0");
                request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                break;
            case "adAlm":
                getServletContext().setAttribute("tipAd", "Alumno");
                request.setAttribute("act", "0");
                request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                break;
            case "adDmn":
                getServletContext().setAttribute("tipAd", "Administrador");
                request.setAttribute("act", "0");
                request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                break;
            case "adMtr":
                getServletContext().setAttribute("tipAd", "Matriculador");
                request.setAttribute("act", "0");
                request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                break;
            case "busqADmin":
                String prs = (String) request.getParameter("busqueda");
                Persona aux = new Persona(0, "indefinido", "indefinido", "indefinido", 0, "indefinido");
                String tip = (String) request.getParameter("intslt");
                request.setAttribute("act", tip);
                switch ((String) getServletContext().getAttribute("tipAd")) {
                    case "Alumno":
                        aux = new Alumno();
                        break;
                    case "Profesor":
                        aux = new Profesor();
                        break;
                    case "Administrador":
                        aux = new Administrador();
                        break;
                    case "Matriculador":
                        aux = new Matriculador();
                        break;
                    default:
                        break;
                }
                switch (tip) {
                    case "3":
                        gestor.borrarP(prs);
                        request.getRequestDispatcher("AdPersona.jsp").forward(request, response);

                        break;
                    case "2":
                    case "4":
                        gestor.buscarPer(aux, prs);

                        ArrayList<Persona> p1 = new ArrayList<>();
                        p1.add(aux);
                        request.setAttribute("Personas", p1);
                        request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                        break;

                    case "5":

                        if (aux instanceof Alumno) {
                            ArrayList<Alumno> l = new ArrayList<>();
                            gestor.mostrarEstNom(prs, l);
                            request.setAttribute("Personas", l);
                            request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                        } else {
                            ArrayList<Profesor> ll = new ArrayList<>();
                            gestor.mostrarProNom(prs, ll);
                            request.setAttribute("Personas", ll);
                            request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                        }
                        break;
                    case "6":
                        ArrayList<Alumno> l = new ArrayList<>();
                        gestor.mostrarPCar(prs, l);
                        request.setAttribute("Personas", l);
                        request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                        break;
                    default:

                        request.setAttribute("Personas", aux);
                        request.getRequestDispatcher("AdPersona.jsp").forward(request, response);
                        break;

                }

                break;

            case "busqCar":
                prs = (String) request.getParameter("busqueda");
                tip = (String) request.getParameter("intslt");
                String tad = (String) getServletContext().getAttribute("tipAd");
                request.setAttribute("act", tip);
                Carrera pp = new Carrera();
                Curso cc = new Curso();
                ArrayList<Carrera> ca = null;
                ArrayList<Curso> cu = null;

                switch (tip) {
                    case "3":
                        if (tad.equals("Carrera")) {
                            gestor.BorrarCarrera(prs);
                        } else {
                            gestor.BorrarCurso(prs);
                        }
                        request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                        break;
                    case "2":
                    case "4":
                        if (tad.equals("Carrera")) {
                            ca = new ArrayList<>();
                            gestor.MostrarCarreraC(pp, prs);
                            ca.add(pp);
                            request.setAttribute("Carreras", ca);
                        } else {
                            cu = new ArrayList<>();
                            gestor.MostrarCurso(cc, prs, 2);
                            cu.add(cc);
                            request.setAttribute("Cursos", cu);
                        }
                        request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                        break;

                    case "5":
                        if (tad.equals("Carrera")) {
                            ca = new ArrayList<>();
                            gestor.MostrarCarreraN(pp, prs);
                            ca.add(pp);
                            request.setAttribute("Carreras", ca);
                        } else {
                            cu = new ArrayList<>();
                            gestor.MostrarCurso(cc, prs, 1);
                            cu.add(cc);
                            request.setAttribute("Cursos", cu);
                        }
                        request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                        break;
                    case "6":
                        cu = new ArrayList<>();
                        gestor.MostrarCursos(cu, prs);
                        request.setAttribute("Cursos", cu);
                        request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                        break;
                    default:
                        request.getRequestDispatcher("Carrera.jsp").forward(request, response);
                        break;

                }

                break;

            case "nota":
                nota(request, response);
                request.getRequestDispatcher("Nota.jsp").forward(request, response);
                break;
            case "actualizaN":
                gestor.actualiza(new Nota(Float.parseFloat(request.getParameter("nota")),
                        "curso", request.getParameter("Est"), request.getParameter("grp"), "condiion"));
            //request.getRequestDispatcher("Nota.jsp").forward(request, response);
            //break;
            case "notas":
                notasGrp(request, response);
                request.getRequestDispatcher("Nota.jsp").forward(request, response);
                break;
            case "OFRT":
                request.setAttribute("frt", "1");
                request.getRequestDispatcher("OfertaAcd.jsp").forward(request, response);
                break;
            case "MoAGrp":
                String gru = (String) request.getParameter("grp");
                String CRRS = (String) request.getParameter("CRSS");
                Grupo p = new Grupo();
                gestor.Buscar(p, gru);
                ArrayList<Grupo> grpp = new ArrayList<>();
                grpp.add(p);
                request.setAttribute("grups", grpp);
                request.setAttribute("idid", p.getId());
                request.setAttribute("CRS", CRRS);
                request.getRequestDispatcher("OfertaAcd.jsp").forward(request, response);
                break;
                
            case "CnfCar":
                String car = (String) request.getParameter("carrera");
                String ciclo = (String) request.getParameter("ciclo");
                Carrera c = new Carrera();
                gestor.MostrarCarreraC(c, car);
                if (!c.getCodigo().isEmpty()) {
                    ArrayList<Curso> curss = new ArrayList<>();
                    gestor.MostrarCursos(curss, car, ciclo);
                    request.setAttribute("cursos", curss);
                }
                request.getRequestDispatcher("OfertaAcd.jsp").forward(request, response);
                break;
            case "CHGRP":
                String id =(String)request.getParameter("idid");
                Grupo gr = new Grupo((String) request.getParameter("codigo"),Integer.parseInt((String) request.getParameter("numero")),(String) request.getParameter("horario"),(String) request.getParameter("profesor"),(String) request.getParameter("curso"));
                if(id.isEmpty())
                    gestor.agregarGrupo(gr.getNumero(), gr.getHorario(), gr.getProfesor(), gr.getCurso());
                else gestor.actualizar(gr);
              //  request.getRequestDispatcher("OfertaAcd.jsp").forward(request, response);
              //  break;
            case "GRPSCRS":
                String crs = (String) request.getParameter("CRS");
                ArrayList<Grupo> gprs = new ArrayList<>();
                gestor.BuscarGrpCrs(crs, gprs);
                request.setAttribute("Grupos", gprs);
                request.setAttribute("CRS", crs);
                request.getRequestDispatcher("OfertaAcd.jsp").forward(request, response);
            case "MDEM":
                String ced= (String)request.getParameter("usuario");
                //request.setAttribute("ced",ced);
                 matriculados(request, response,ced);
                request.getRequestDispatcher("Matricula.jsp").forward(request, response);
                break;
            case "desmatri":
                desmatricular( request, response);
                 request.getRequestDispatcher("Matricula.jsp").forward(request, response);
                break;
                
            case "matricula":
                 
                 matricular(request, response);
                request.getRequestDispatcher("Matricula.jsp").forward(request, response);
                break;
            default:
                break;

        }
    }
    
        private void matriculados(HttpServletRequest request, HttpServletResponse response,String ced)
    {
        ArrayList<Nota> l = new ArrayList<Nota>();
        gestor.matriculados(""+request.getParameter("usuario"), l);
        request.setAttribute("matriculados", l); 
        request.setAttribute("style", "visible");
       request.setAttribute("ced",ced);
        
    }
    private void matricular(HttpServletRequest request, HttpServletResponse response)
    {
       String ced=""+request.getParameter("usuario");
       String lol = request.getParameter("curso")+"-"+request.getParameter("grupo");
        Nota not= new Nota(0,""+request.getParameter("curso"),ced ,lol, "encurso");
        gestor.Matricular(not);
        request.setAttribute("style", "visible");
        matriculados(request,response,ced);
       
        
    }
    private void desmatricular(HttpServletRequest request, HttpServletResponse response)
    {
        String ced=""+request.getParameter("usuario");
        String cur= ""+request.getParameter("cur");
        gestor.desmatricula(ced, cur);
        request.setAttribute("style", "visible");
        matriculados(request,response,ced);
       
    }


    private void notasGrp(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Nota> l = new ArrayList<>();
        String cdogrp = "" + request.getParameter("grp");
        gestor.notasPgrupo(cdogrp, l);
        // request.setAttribute("cdogrp", cdogrp);
        request.setAttribute("notas", l);
        request.setAttribute("style", "block");

    }

    private void historial(HttpServletRequest request, HttpServletResponse response) {
        ArrayList<Nota> l = new ArrayList<Nota>();
        String Alm = (String) request.getAttribute("Almn");
        gestor.ConsultaHistorial(Alm, l);

//       ArrayList<String> l = new ArrayList<>();
//       l.add("hola");
//       l.add("hola2");
//       l.add("hola3");
//        //String Alm = (String)request.getAttribute("Almn");
        //gestor.ConsultaHistorial(Alm, l);
        //System.out.println(l.toString());
        request.setAttribute("historial", l);
    }

    private void nota(HttpServletRequest request, HttpServletResponse response) {

        ArrayList<Grupo> l = new ArrayList<>();
        gestor.gruposProfe((String) getServletContext().getAttribute("usr"), l);
        request.setAttribute("GRPSPRF", l);
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
