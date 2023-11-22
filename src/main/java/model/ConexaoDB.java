package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDB{

	public static Connection getConnection() throws SQLException{
			try {
				String database = "jdbc:mysql://localhost/toDo";
				String usuario = "root";
				String senha = "";
				Class.forName ("com.mysql.cj.jdbc.Driver");
				return DriverManager.getConnection( database, usuario, senha);
			}catch (ClassNotFoundException e) { 
				throw new SQLException(e.getException());
			}
	}
	
}
