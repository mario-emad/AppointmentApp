<%-- 
    Document   : PatientRegister
    Created on : Oct 8, 2019, 10:21:41 AM
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
        <link href="CSS/PatientRegister.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div>
            <div id="patientlogindiv">
                <output>Login field</output><br/><br/>
                <form action="PatientLoginS" method="post">
                    <input required type="text" placeholder="Enter your username ..." name="PLusername"/><br/><br/>
                    <input required type="text" placeholder="Enter your password ..." name="PLpassword"/><br/><br/>
                    <input type="submit" value="Log In"/>
                </form>
            </div>
            <div id="patientregisterdiv">
                <output>Register field</output><br/><br/>
                <form action="PatientRegisterS" method="post">
                    <input required type="text" placeholder="Enter your name" name="Pname"/><br/><br/>
                    <input required type="text" placeholder="Enter your username" name="Pusername"/><br/><br/>
                    <input required type="text" placeholder="Enter your password" name="Ppassword"/><br/><br/>
                    <input required type="date" placeholder="Enter your birthdate" name="Pbirthdate"/><br/><br/>
                    <input required type="text" placeholder="Enter your phone" name="Pphone"/><br/><br/>
                    <textarea name="Pcomment"></textarea><br/><br/>
                    <input type="submit" value="Register"/>
                </form>
            </div>
        </div>
    </body>
</html>
