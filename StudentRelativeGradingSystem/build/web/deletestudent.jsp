     <%@page import="java.sql.*" %>
        
        
        <%
          
          String enrollment = request.getParameter("en");
          try{                         
              Class.forName("com.mysql.jdbc.Driver");
              Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultdata","root","");
              Statement st = cn.createStatement();  
              st.executeUpdate("delete from result where EnrollmentNo = "+enrollment+" ");
              st.executeUpdate("delete from student where EnrollmentNo = "+enrollment+" ");
             }catch(Exception e){
              System.out.println(e);
          }    
        response.sendRedirect("showStudent.jsp");
        %>