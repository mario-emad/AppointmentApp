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
import javax.servlet.http.HttpSession;

public class DoctorLoginS extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String username = request.getParameter("DLusername"),
                    password = request.getParameter("DLpassword");

            Connection con = ConnectionClass.ConnectionMethod();
            Statement statement = con.createStatement();
            String confirmdoctorSQL = "SELECT username_doctor, password_doctor FROM doctor;";
            ResultSet resultSet = statement.executeQuery(confirmdoctorSQL);
            while (resultSet.next()) {
                if (username.equals(resultSet.getString("username_doctor")) & password.equals(resultSet.getString("password_doctor"))) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
//                    response.sendRedirect("PatientList.jsp");
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("PatientList.jsp");
                    requestDispatcher.forward(request, response);
                }
            }
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("DoctorRegister.jsp");
            requestDispatcher.forward(request, response);

        } catch (SQLException ex) {
            Logger.getLogger(DoctorLoginS.class.getName()).log(Level.SEVERE, null, ex);
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
