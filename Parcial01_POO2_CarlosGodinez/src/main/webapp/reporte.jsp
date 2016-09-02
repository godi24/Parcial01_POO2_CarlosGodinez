<%-- 
    Document   : report1
    Created on : 08-08-2016, 09:19:17 PM
    Author     : aleso
--%>

<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.sf.jasperreports.engine.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.sql.*" %> 

<%  
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3308/parcial01_poo2_carlosgodinez", "root", "123456"); 
    File reportFile = new File(application.getRealPath("reportes/reporte.jasper"));
    Map parameters = new HashMap();
    int codiUnid = Integer.parseInt(request.getParameter("cmbGrupo"));
    parameters.put("Codigo", codiUnid); 
    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath (), parameters, conexion); 
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length); 
    ServletOutputStream ouputStream = response.getOutputStream(); 
    ouputStream.write(bytes, 0, bytes.length); 
    ouputStream.flush(); 
    ouputStream.close();
            
%>