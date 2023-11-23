<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page language="java" import = "model.ConexaoDB"%>

<% 
	String nome = request.getParameter("taskName");
	String prioridade = request.getParameter("taskPriority");
	boolean diaria = Boolean.parseBoolean(request.getParameter("label1"));
	
	System.out.print(nome);
	System.out.print(prioridade);
	System.out.print(diaria);

	try{
		
		Connection con = ConexaoDB.getConnection();
		
		String sql = "insert into tarefa(nome,prioridade,diaria) value(?,?,?)";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		
		stmt.setString(1, nome);
		stmt.setString(2, prioridade);
		stmt.setBoolean(3, diaria);
		
		stmt.execute();
		stmt.close();
		con.close();
		
	}catch(Exception e){
		
		out.print("ERRO!" + e);
		
	}



%>