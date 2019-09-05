/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KHALID
 */
public class AdminCheck extends HttpServlet {

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
        response.sendRedirect("index.jsp");
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
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         System.out.println("Checking admin login");
         Connection conn=null;
         String url="jdbc:mysql://localhost:3306/";
         String dbName="loginjdbc";
         String dbDriver="com.mysql.jdbc.Driver";
         String dbUser="root";
         String dbPass="7487";
         String username="";
         String userpass="";
         String strQuery="";
         Statement st=null;
         ResultSet rs=null;
         HttpSession session=request.getSession(true);
         try {
            Class.forName(dbDriver);
            conn=DriverManager.getConnection(url+dbName, dbUser, dbPass);
            username=request.getParameter("usrnm").toString();
            userpass=request.getParameter("pwd").toString();
            strQuery="select * from user where user='"+username+"' and password='"+userpass+"'";
             System.out.println(strQuery);
             st=conn.createStatement();
             rs=st.executeQuery(strQuery);
             int count=0;
             while(rs.next()){
                 session.setAttribute("username", rs.getString(2));
                 count++;
             }
             if(count>0){
                 response.sendRedirect("adminHome.jsp");
             }else{
                 request.setAttribute("err", "Login Failed");
                 request.getRequestDispatcher("index.jsp").forward(request, response);               
             }
        } catch (Exception e) {
            throw new ServletException("Login failed",e);
        }finally{
             try {
                 conn.close();
             } catch (SQLException e) {
                 
             }
         }
         
       
    }

 
}
