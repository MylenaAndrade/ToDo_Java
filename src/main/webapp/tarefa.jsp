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


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tarefa Criada</title>
    <link rel="stylesheet" href="style.css" />
    <!-- Bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <script
      defer
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="center column gap-2">
      <h1>Tarefa criada com sucesso!</h1>
      <a href="todos.jsp" class="btn btn-primary">Voltar</a>
    </div>
  </body>
</html>