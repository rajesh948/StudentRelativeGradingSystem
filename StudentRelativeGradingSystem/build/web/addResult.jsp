<%-- 
    Document   : newjsp
    Created on : 24-Feb-2022, 7:10:42 pm
    Author     : Ashvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%@page import="java.sql.*" %>
        
        
        <%
          try{
//              long enrollment = Long.parseLong(request.getParameter("senroll"));
              String enrollment = request.getParameter("senroll");
              String toc = request.getParameter("toc"); 
              String mpi = request.getParameter("mpi");
              String iot = request.getParameter("iot");
              String wp = request.getParameter("wp");
              String dm = request.getParameter("dm"); 
              String ajp = request.getParameter("ajp");
              String ipdc = request.getParameter("ipdc");
              String de = request.getParameter("de");
              Class.forName("com.mysql.jdbc.Driver");
              Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultdata","root","");
              Statement st = cn.createStatement();   
              st.executeUpdate("update student set status=1 where EnrollmentNo = '"+enrollment+"' ");
              st.executeUpdate("insert into result values('"+enrollment+"','"+toc+"','"+mpi+"','"+iot+"','"+wp+"','"+dm+"','"+ajp+"','"+ipdc+"','"+de+"')");
               response.sendRedirect("addResultofstudent.jsp");
          }catch(Exception e){
              System.out.println(e);
          }  

        %>
 
