<%-- 
    Document   : DoctorRegister
    Created on : Oct 8, 2019, 10:21:15 AM
    Author     : Mario
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.classes.ConnectionClass"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Connection con = ConnectionClass.ConnectionMethod();
    Statement statement = null;
    ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/DoctorRegister.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div>
            <div id="doctorlogindiv" action="DoctorLoginS" method="post">
                <output>Login field</output><br/><br/>
                <form action="DoctorLoginS" method="post">
                    <input required type="text" placeholder="Enter your username ..." name="DLusername"/><br/><br/>
                    <input required type="text" placeholder="Enter your password ..." name="DLpassword"/><br/><br/>
                    <input type="submit" value="Log In"/>
                </form>
            </div>
            <div id="doctorregisterdiv">
                <output>Register field</output><br/><br/>
                <form id="doctorregisterform" action="DoctorRegisterS" method="post">
                    <input required type="text" placeholder="Enter your name" name="Dname"/><br/><br/>
                    <input required type="text" placeholder="Enter your username" name="Dusername"/><br/><br/>
                    <input required type="text" placeholder="Enter your password" name="Dpassword"/><br/><br/>
                    <select required form="doctorregisterform" name="Djobtype">
                        <option value=""></option>
                        <%
                            statement = con.createStatement();
                            String jobtypeSQL = "SELECT title_jobtype FROM jobtype;";
                            resultSet = statement.executeQuery(jobtypeSQL);
                            while (resultSet.next()) {
                        %>
                        <option value="<%=resultSet.getString("title_jobtype")%>"><%=resultSet.getString("title_jobtype")%></option>
                        <%
                            }
                        %>
                    </select><br/><br/>
                    <input required type="text" placeholder="Enter your phone" name="Dphone"/><br/><br/>
                    <input required type="email" placeholder="Enter your email" name="Demail"/><br/><br/>
                    <textarea placeholder="Enter comment if you want ..." name="Dcomment"></textarea><br/><br/>
                    <input type="submit" value="Register"/>
                </form>
            </div>
        </div>
    </body>
</html>
