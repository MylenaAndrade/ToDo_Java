package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoDB{
	
	private Connection con;
	
	public void iniciaDb(){
			try {
				String database = "jdbc:mysql://localhost/toDo";
				String usuario = "root";
				String senha = "root";
				Class.forName ("com.mysql.jdbc.Driver");
				con = (Connection) DriverManager.getConnection( database, usuario, senha);
			}catch (Exception e) { 
				e.printStackTrace();
			}
	}
	
	public void techalid(){
			try {
				con.close();
			} catch (Exception e ) {
				e.printStackTrace();
			}
	}
	
	public Connection getConexao(){
			return con;
	}
}
