<%-- 
    Document   : newjsp
    Created on : 24-Feb-2022, 7:10:42 pm
    Author     : Ashvin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <style>
        * {
            margin: 0px;
            padding: 0px;

        }

        body {
            background-color: rgb(230, 230, 235);
        }

        h1 {
            color: white;
            font-family: serif;
            background-color: rgb(103, 103, 250);
            text-align: center;
            padding: 30px 1px;
        }

        table {
            max-width: 75%;
            margin: 20px auto;
        }

        table,
        td,
        th {

            text-align: center;
            border: 2px solid rgb(126, 124, 240);
            border-collapse: collapse;
            font-family: Cambria;
            background-color: white;

        }

        th {
            padding: 0px 3px;
            background-color: aquamarine;
            font-size: larger;
        }

        td {
            padding: 7px 0px;
            font-size: large;
        }

        a {
            font-size: x-large;
            font-weight: bold;
            color: rgb(61, 54, 46);
            font-family: cambria;
            border: 3px outset rgb(90, 92, 168);
            border-radius: 4px;
            margin: auto;
            padding: 5px 40px;
            text-decoration: none;
            background-color: rgb(175, 198, 241);
            box-shadow: 1px 2px 4px gray;

        }
        a:hover{
            border: 3px outset rgb(101, 104, 252);
            background-color: rgb(120, 190, 231);
            box-shadow: 4px 4px 4px gray;
        }
        a:active {
            background-color: rgb(114, 156, 233);
        }
    </style>
            
    </head>
    <body>
        <h1>Your Result</h1>

    <table>
        <tr>
            <th>Student Name</th>
            <th>Enrollment No.</th>
            <th>Sem</th>
            <th>Course</th>
            <th>Branch Name</th>
            <th>City</th>
        </tr>
        <%@page import="java.sql.*" %>
        
        
        <%
          try{
              String enrollment = request.getParameter("enroll");
                         
              Class.forName("com.mysql.jdbc.Driver");
              Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultdata","root","");
              Statement st = cn.createStatement();  
              ResultSet rs = st.executeQuery("SELECT * FROM student INNER JOIN result WHERE student.EnrollmentNo = result.EnrollmentNo and student.EnrollmentNo = '"+enrollment+"' ");
       
              if(rs.next()){
               %>

        <tr>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getInt(5) %></td>
            <td>Bachelor Of Engineering</td>
            <td><%= rs.getString(4) %></td>
            <td><%= rs.getString(6) %></td>
        </tr>
        <tr>
            <th >Subject Code</th>
            <th  colspan="2">Subject Name</th>
            <th>Total Mark</th>
            <th>Passing Mark</th>
            <th style="width:15%">Mark</th>
        </tr>
       
       
        <tr>
            <td>3160704</td>
            <td colspan="2">Theory Of Computation</td>
            <td>100</td>
            <td>33</td>
            <td><%= rs.getInt(9) %></td>
        </tr>
        <tr>
            <td>3160712</td>
            <td colspan="2">Microprocessor And Interfacing</td>
            <td>100</td>
            <td>33</td>
            <td><%= rs.getInt(10) %></td>
        </tr>
        <tr>
            <td>3160716</td>
            <td colspan="2">Internet Of Things</td>
            <td>100</td>
            <td>33</td>
            <td><%= rs.getInt(11) %></td>
        </tr>
        <tr>
            <td>3160713</td>
            <td colspan="2">Web Programming</td>
            <td>100</td>
            <td>33</td>
            <td><%= rs.getInt(12) %></td>
        </tr>
        <tr>
            <td>3160714</td>
            <td colspan="2">Data Mining</td>
            <td>100</td>
            <td>33</td>
            <td><%= rs.getInt(13) %></td>
        </tr>
        <tr>
            <td>3160707</td>
            <td colspan="2">Advance Java Programming</td>
            <td>100</td>
            <td>33</td>
            <td><%= rs.getInt(14) %></td>
        </tr>
        <tr>
            <td>3160003</td>
            <td colspan="2">IPDC</td>
            <td>100</td>
            <td>33</td>
            <td><%= rs.getInt(15) %></td>
        </tr>
        <tr>
            <td>3160001</td>
            <td colspan="2">Design Engineering II-B</td>
            <td>100</td>
            <td>33</td>
            <td><%= rs.getInt(16) %></td>
        </tr>
        <tr>
            <th colspan="3">Total Marks</th>
            <th colspan="2">Percentage</th>
            <th>Result</th>

        </tr>
        <tr>
            <td colspan="3"><%int sum = rs.getInt(9)+rs.getInt(10)+rs.getInt(11)+rs.getInt(12)+rs.getInt(13)+rs.getInt(14)+rs.getInt(15)+rs.getInt(16); out.println(sum); %></td>
            <td colspan="2"><%= sum/8+"%"%></td>
            <%
  String result;
if(rs.getInt(9)>=33 && rs.getInt(10)>=33 && rs.getInt(11)>=33 && rs.getInt(12)>=33 && rs.getInt(13)>=33 && rs.getInt(14)>=33 && rs.getInt(15)>=33 && rs.getInt(16)>=33){
                result = "Clear";
                }else{
                result = "Not Clear";
                }
            
            %>
            <td><%= result %></td>
        </tr>
   
                <% }else{
   response.sendRedirect("errorShowResult.html");
}
          }catch(Exception e){
              System.out.println(e);
          }    
        %>
         </table>

    <center>
        <a href="studentresult.html">Back</a>
        <a onclick="window.print();" target="_blank" style="cursor:pointer;">
            <img src="print.png">
        </a>
    </center>
    </body>
</html>
