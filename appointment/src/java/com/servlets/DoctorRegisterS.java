
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


public class DoctorRegisterS extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String name = request.getParameter("Dname"),
                    username = request.getParameter("Dusername"),
                    password = request.getParameter("Dpassword"),
                    jobtype = request.getParameter("Djobtype"),
                    phone = request.getParameter("Dphone"),
                    email = request.getParameter("Demail"),
                    comment = request.getParameter("Dcomment");
                    int JOBTYPE = 0;
            
            Connection con = ConnectionClass.ConnectionMethod();
            Statement statement = con.createStatement();
            String jobtypeidSQL = "SELECT ID_jobtype FROM jobtype WHERE title_jobtype = '" + jobtype + "';";
            ResultSet resultSet = statement.executeQuery(jobtypeidSQL);
            if(resultSet.next()){
                JOBTYPE = resultSet.getInt("ID_jobtype");
            }
            String insertdoctorSQL = "INSERT INTO doctor(name_doctor, username_doctor, password_doctor, jobtype_doctor, phone_doctor, email_doctor, comment_doctor) VALUES ('" + name + "','" + username + "','" + password + "'," + JOBTYPE + ",'" + phone + "','" + email + "','" + comment + "')";
            statement.executeUpdate(insertdoctorSQL);
            
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("DoctorRegister.jsp");
            requestDispatcher.forward(request, response);
            
        } catch (SQLException ex) {
            Logger.getLogger(DoctorRegisterS.class.getName()).log(Level.SEVERE, null, ex);
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
