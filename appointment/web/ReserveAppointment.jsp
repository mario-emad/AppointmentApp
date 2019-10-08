<%-- 
    Document   : ReserveApoointment
    Created on : Oct 8, 2019, 2:12:21 PM
    Author     : Mario
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.classes.ConnectionClass"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Connection con = ConnectionClass.ConnectionMethod();
    Statement statement = null, statement1 = null;
    ResultSet resultSet = null, resultSet1 = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <div>
            <output>choose the doctor you want ?</output>
            <form action="AppointmentList.jsp" id="doctorselectform" method="get">
                <select form="doctorselectform" name="doctorselect">
                    <%
                        statement = con.createStatement();
                        String jobtypeSQL = "SELECT ID_jobtype, title_jobtype FROM jobtype;";
                        resultSet = statement.executeQuery(jobtypeSQL);
                        String jobtitle = null;
                        int jobid = 0;
                        while (resultSet.next()) {
                            jobtitle = resultSet.getString("title_jobtype");
                            jobid = resultSet.getInt("ID_jobtype");
                    %>
                    <optgroup label="<%=jobtitle%>">
                        <%
                            statement1 = con.createStatement();
                            String jobdoctorsSQL = "SELECT name_doctor FROM doctor WHERE jobtype_doctor = " + jobid + ";";
                            resultSet1 = statement1.executeQuery(jobdoctorsSQL);
                            while (resultSet1.next()) {
                        %>
                        <option><%=resultSet1.getString("name_doctor")%></option>
                        <%
                            }
                        %>

                    </optgroup>
                    <%
                        }
                    %>
                </select>
                <input type="submit" value="Choose"/>
            </form>
        </div>
    </body>
</html>
