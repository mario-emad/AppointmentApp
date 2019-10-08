
package com.servlets;

import com.classes.ConnectionClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PatientRegisterS extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
            String name = request.getParameter("Pname"),
                    username = request.getParameter("Pusername"),
                    password = request.getParameter("Ppassword"),
                    birthdate = request.getParameter("Pbirthdate"),
                    phone = request.getParameter("Pphone"),
                    comment = request.getParameter("Pcomment");
            
            Connection con = ConnectionClass.ConnectionMethod();
            Statement statement = con.createStatement();
            String insertPatientSQL = "INSERT INTO patient(name_patient, username_patient, password_patient, birthdate_patient, phone_patient, comment_patient) VALUES ('" + name + "','" + username + "','" + password + "','" + birthdate + "','" + phone + "','" + comment + "');";
            statement.executeUpdate(insertPatientSQL);
            
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("DoctorRegister.jsp");
            requestDispatcher.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(PatientRegisterS.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
