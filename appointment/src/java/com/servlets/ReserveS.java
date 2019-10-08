
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


public class ReserveS extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String time = request.getParameter("servtime");
            String doctor = request.getParameter("doctor");
            String date = request.getParameter("date");
            HttpSession session = request.getSession();
            String patient = (String) session.getAttribute("username");
            out.print(patient + " " + time + " " + doctor + " " + date);
            int docid = 0, patid = 0;
            Connection con = ConnectionClass.ConnectionMethod();
            Statement statement = con.createStatement();
            String doctoridSQL = "SELECT ID_doctor FROM doctor WHERE name_doctor = '" + doctor + "';";
            ResultSet resultSet = statement.executeQuery(doctoridSQL);
            if(resultSet.next()){
                docid = resultSet.getInt("ID_doctor");
            }
            String patientidSQL = "SELECT ID_patient FROM patient WHERE username_patient = '" + patient + "';";
            resultSet = statement.executeQuery(patientidSQL);
            if(resultSet.next()){
                patid = resultSet.getInt("ID_patient");
            }
            String insertappointmentSQL = "INSERT INTO doctor_has_patient(ID_Doctor, ID_Patient, date, time) VALUES (" + docid + "," + patid + ",'" + date + "'," + time + ");";
            statement.executeUpdate(insertappointmentSQL);
            
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("ReserveAppointment.jsp");
            requestDispatcher.forward(request, response);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(ReserveS.class.getName()).log(Level.SEVERE, null, ex);
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
