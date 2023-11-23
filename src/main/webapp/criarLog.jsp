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