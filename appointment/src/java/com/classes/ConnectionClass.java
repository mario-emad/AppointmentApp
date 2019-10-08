
package com.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ConnectionClass {
    private final static String url = "jdbc:mysql://localhost/appointment";
    private final static String username = "root";
    private final static String password = "";
    private static Connection connectionObject;

    public static Connection ConnectionMethod() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connectionObject = (Connection) DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionClass.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConnectionClass.class.getName()).log(Level.SEVERE, null, ex);
        }
        return connectionObject;
    }
}
