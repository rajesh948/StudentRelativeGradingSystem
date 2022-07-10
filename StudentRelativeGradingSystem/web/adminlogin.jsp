<%
   String username = request.getParameter("uname");
   String password = request.getParameter("pass");
   
   if(username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin123"))
   {
       response.sendRedirect("adminPage.html");
   }else{
       response.sendRedirect("errorAdmin.html");
   }
    %>