<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import = "java.sql.*"%> <%@ page language="java" import =
"model.ConexaoDB"%>

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
    <script>
      function criarLog() {
          var xhr = new XMLHttpRequest();
          xhr.open("POST", "criarLog.jsp", true);
          xhr.setRequestHeader("Content-type", "text/plain");
          xhr.onreadystatechange = function() {
              if (xhr.readyState === XMLHttpRequest.DONE) {
                  if (xhr.status === 200) {
                      alert("Arquivo de log criado com sucesso!");
                  } else {
                      alert("Erro ao criar arquivo de log.");
                  }
              }
          };
          xhr.send("Criar arquivo de log com os dados dos usuários...");
      }
</script>
  </head>
  <body>
    <div class="container mt-4">
      <h1>Minha Lista de Tarefas</h1>
      <button class="btn" type="button" onclick="criarLog">Gerar LOG</button>

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
            <option value="mÃ©dia">Media</option>
            <option value="alta">Alta</option>
          </select>
        </div>

        <div class="form-group">
          <label>Diario</label><br />
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
 	 <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                conn = ConexaoDB.getConnection();
                stmt = conn.createStatement();
                String sql = "SELECT * FROM tarefa";
                rs = stmt.executeQuery(sql);
        %>
        <table class="table">
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Prioridade</th>
                <th>Diaria</th>
            </tr>
            <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("nome") %></td>
                <td><%= rs.getString("prioridade") %></td>
                <td><%= rs.getBoolean("diaria") ? "Sim" : "Não" %></td>
            </tr>
            <% } %>
        </table>
        <% } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } %>
      </ul>
    </div>
  </body>
</html>
