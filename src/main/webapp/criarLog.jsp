<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*"%>
<%@ page language="java" import = "model.ConexaoDB"%>
<%@ page language="java" import = "java.io.*"%>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {

        stmt = conn.createStatement();
        String sql = "SELECT * FROM todos";
        rs = stmt.executeQuery(sql);

        File arquivoLog = new File("todos_log.txt");
        FileWriter fw = new FileWriter(arquivoLog, true); 

        while (rs.next()) {
            int id = rs.getInt("id");
            String nome = rs.getString("nome");
            String prioridade = rs.getString("prioridade");
            boolean diaria = rs.getBoolean("diaria");
            
            String statusTexto = (diaria) ? "Sim" : "Não";
            
            String logText = "ID: " + id + ", Nome: " + nome + ", Prioridade: " + prioridade + ", Diaria: " + statusTexto + "\n";
            fw.write(logText);
        }

        fw.close();
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

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>O LOG foi gerado!</title>
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
      <h1>O LOG foi gerado!</h1>
      <a href="todos.jsp" class="btn btn-primary">Voltar</a>
    </div>
  </body>
</html>