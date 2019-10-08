<%-- 
    Document   : PatientList
    Created on : Oct 8, 2019, 12:32:33 PM
    Author     : Mario
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.classes.ConnectionClass"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table>
            <tr>
                <th>Patient name</th>
                <th>Date</th>
                <th>Time</th>
            </tr>
            <%
                HttpSession session1 = request.getSession();
                String druname = (String) session1.getAttribute("username");
                Connection con = ConnectionClass.ConnectionMethod();
                Statement statement = con.createStatement();
                String patientlistSQL = "SELECT patient.name_patient, doctor_has_patient.date, doctor_has_patient.time FROM doctor_has_patient INNER JOIN patient ON doctor_has_patient.ID_Patient = patient.ID_patient INNER JOIN doctor ON doctor_has_patient.ID_Doctor = doctor.ID_doctor WHERE doctor.username_doctor = '" + druname + "';";
                ResultSet resultSet = statement.executeQuery(patientlistSQL);
                while (resultSet.next()) {
            %>
            <tr>
                <th><%=resultSet.getString("name_patient")%></th>
                <th><%=resultSet.getString("date")%></th>
                <th><%=resultSet.getString("time")%></th>
            </tr>
            <%
                }


            %>

        </table>
    </body>
</html>
