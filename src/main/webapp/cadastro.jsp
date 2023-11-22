<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page language="java" import = "model.ConexaoDB"%>
<%@ page language="java" import = "model.Hasher"%>

<%

	String email = request.getParameter("email");
	String senha = request.getParameter("senha");
	
	String password = Hasher.encrypt(senha);
	
	try{
		
		Connection con = ConexaoDB.getConnection();
		
		String sql = "insert into cadastro(email,senha) value(?,?)";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		
		stmt.setString(1, email);
		stmt.setString(2, password);
		
		stmt.execute();
		stmt.close();
		con.close();
		
	}catch(Exception e){
		
		out.print("ERRO!" + e);
		
	}









%>
