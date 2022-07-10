<%-- 
    Document   : showStudent
    Created on : 26-Feb-2022, 2:09:27 pm
    Author     : Ashvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;

        }

        body {
            background-color: rgb(219, 219, 221);
        }

        h1 {
            color: white;
            font-family: serif;
            background-color: rgb(103, 103, 250);
            text-align: center;
            padding: 30px 1px;
        }

        ul {
            display: flex;
            border-top: 4px solid white;
            list-style: none;
            padding: 10px 1px;
            background-color: rgb(163, 182, 248);
        }

        ul li a {
            text-decoration: none;
            font-size: larger;
            font-family: Cambria;
            font-weight: bold;
            padding: 10px 12px;
            color: rgb(92, 36, 36);
            transition: all .4s;
        }

        #l1,
        a:hover {
            color: white;
            /* background-color:rgb(172, 129, 253); */
            /* border-top: 4px solid rgb(24, 44, 99); */

        }

        #l1 {
            color: white;
            background-color: rgb(172, 129, 253);
            border-top: 4px solid rgb(24, 44, 99);

        }

        a:active {
            color: black;
        }

        .box {
            margin: 30px 0px;
            display: flex;
            justify-content: center;
        }

        table,
        td,
        th {
            border: 3px solid rgb(126, 124, 240);
            border-radius: 4px;
            border-collapse: collapse;
            font-family: Cambria;

        }

        th {
            padding: 8px 25px;
            text-align: center;
            background-color: aquamarine;
            font-size: larger;
        }

        td {
            padding: 5px 5px;
            font-size: large;
        }

        tr:nth-child(odd) {
            background-color: gainsboro;
        }

        tr:nth-child(even) {
            background-color: white;
        }

        caption {
            font-size: 3rem;
            font-weight: bolder;
            text-shadow: 2px 2px 4px black;
            margin: 6px;
            color: blueviolet;
        }
    </style>
</head>

<body>
    
    <h1>ADMIN PAGE</h1>
    <ul>
        <li><a href="adminPage.html">AddStudent</a></li>
        <li><a href="addResultofstudent.jsp">AddResult</a></li>
        <li><a id="l1" href="">ShowStudent</a></li>
        <li><a href="showResult.jsp">ShowResult</a></li>
        <li><a  href="Graph.jsp">Graph</a></li>
        <li><a href="index.html">Logout</a></li>
    </ul>
        <div class="box">

        <table>
            <caption>All Added Student</caption>

            <tr>
                <th>Enrollment No.</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Department</th>
                <th>Semester</th>
                <th>City</th>
                <th>Delete</th>
            </tr>
      <%@page import="java.sql.*" %>
        
        <%
          try{
                      
              Class.forName("com.mysql.jdbc.Driver");
              Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultdata","root","");
              Statement st = cn.createStatement();  
              ResultSet rs = st.executeQuery("select * from student ");
              
              while(rs.next()){
               %>
        
            <tr>
                <td><%= rs.getLong(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td>Sem - <%= rs.getInt(5) %></td>
                <td><%= rs.getString(6) %></td>
                <td><a href="deletestudent.jsp?en=<%=rs.getLong(1)%>">Delete</a></td>
            </tr>

      <% 
                   }
          }catch(Exception e){
              System.out.println(e);
          }    
        %>
        </table>

    </div>
</body>

</html>
