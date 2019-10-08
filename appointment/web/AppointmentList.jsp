<%-- 
    Document   : AppointmentList
    Created on : Oct 8, 2019, 4:01:40 PM
    Author     : Mario
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.classes.ConnectionClass"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Connection con = ConnectionClass.ConnectionMethod();
    Statement statement = null;
    ResultSet resultSet = null;
    String doctorname = null, date = null;
    int h;
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate localDate = LocalDate.now();
%>
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
                <th>Doctor name</th>
                <th>Date</th>
                <th>Hour</th>
                <th>Reserve doctor</th>
            </tr>
            <%
                doctorname = request.getParameter("doctorselect");
                statement = con.createStatement();
                String doctoridSQL = "SELECT ID_doctor FROM doctor WHERE name_doctor = '" + doctorname + "';";
                resultSet = statement.executeQuery(doctoridSQL);
                int doctorid = 0;
                if (resultSet.next()) {
                    doctorid = resultSet.getInt("ID_doctor");
                }

                date = dtf.format(localDate);
                h = 1;
                List lista = new ArrayList();
                statement = con.createStatement();
                String appointmentSQL = "SELECT doctor.name_doctor, doctor_has_patient.date, doctor_has_patient.time FROM doctor_has_patient INNER JOIN doctor ON doctor_has_patient.ID_Doctor = doctor.ID_doctor WHERE doctor_has_patient.ID_Doctor = " + doctorid + " AND doctor_has_patient.date = '" + date + "';";
                resultSet = statement.executeQuery(appointmentSQL);
                while (resultSet.next()) {
                    lista.add(resultSet.getInt("time"));
                }
                for (int i = 0; i < 10; i++) {
                    if (lista.contains(h)) {
                        continue;
                    } else {
            %>
            <form action="ReserveS?servtime=<%=h%>" method="post">
                <input type="hidden" value="<%=doctorname%>" name="doctor"/>
                <input type="hidden" value="<%=date%>" name="date"/>
                <tr>
                    <th><%=doctorname%></th>
                    <th><%=date%></th>
                    <th><%=h%></th>
                    <th><input type="submit" value="Reserve"/></th>
                </tr>
            </form>
            <%
                    }
                    h++;
                }
            %>

        </table>
    </body>
</html>
