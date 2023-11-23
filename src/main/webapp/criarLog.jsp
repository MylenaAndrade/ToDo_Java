<%@ page contentType="text/plain" %>
<%@ page import="java.io.*" %>
<%
    String logText = request.getReader().lines().reduce("", (accumulator, actual) -> accumulator + actual);

    try {
        File arquivoLog = new File("log.txt");
        FileWriter fw = new FileWriter(arquivoLog, true); 
        fw.write(logText + "\n");
        fw.close();
    } catch (IOException e) {
        e.printStackTrace();
    }
%>