<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page language="java" import = "model.ConexaoDB"%>



<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <title>ToDo List com Bootstrap</title>
    <link
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <script
      defer
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
    ></script>
  </head>
  <body>
    <div class="container mt-4">
      <h1>Minha Lista de Tarefas</h1>

      <form id="todoForm" action="tarefa.jsp" method="post">
        <div class="form-group">
          <label for="taskName">Tarefa:</label>
          <input
            type="text"
            class="form-control"
            id="taskName"
            name="taskName"
            required
          />
        </div>

        <div class="form-group">
          <label for="taskPriority">Prioridade:</label>
          <select class="form-control" id="taskPriority" name="taskPriority">
            <option value="baixa">Baixa</option>
            <option value="mÃ©dia">MÃ©dia</option>
            <option value="alta">Alta</option>
          </select>
        </div>

        <div class="form-group">
          <label>DiÃ¡rio</label><br />
          <div class="form-check form-check-inline">
            <input
              type="checkbox"
              class="form-check-input"
              id="label1"
              name="label1"
              value="true"
            />
            <label class="form-check-label" for="label1">Sim</label>
          </div>
        </div>

        <button type="submit" class="btn btn-primary">Adicionar Tarefa</button>
      </form>

      <h2 class="mt-4">Lista de Tarefas</h2>
      <ul id="taskList" class="list-group">
      <li class="list-group-item">Tarefa 1</li>
      <%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Connection con = ConexaoDB.getConnection();
		
		    stmt = con.createStatement();
		    String sql = "SELECT * FROM tarefa";
		    rs = stmt.executeQuery(sql);
		
		    out.println("<table border='1'>");
		    out.println("<tr><th>ID</th><th>Nome</th><th>Idade</th><th>Diaria</th></tr>");
		    while (rs.next()) {
		        out.println("<tr><td>" + rs.getInt("id") + "</td><td>" + rs.getString("nome") + "</td><td>" + rs.getString("prioridade") + "</td><td>" + rs.getBoolean("diaria") + "</td></tr>");
		    }
		    out.println("</table>");
		
		} catch (Exception e) {
		    e.printStackTrace();
		} finally {
		    try {
		        if (rs != null) rs.close();
		        if (stmt != null) stmt.close();
		        if (conn != null) conn.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}

	
	%>
      
      </ul>
    </div>
  </body>
</html>
