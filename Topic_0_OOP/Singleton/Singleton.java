package Topic_0.Singleton;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;


public class Singleton {

    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection=(Connection)DriverManager.getConnection("jdbc:mysql://localhost:3000/test","root","1234");

            System.out.println("successful connection");
        }
        catch (ClassNotFoundException | SQLException e){
            System.out.println(e.getMessage());
        }
    }
    public static Connection getConnection(){
        return connection;
    }



}
