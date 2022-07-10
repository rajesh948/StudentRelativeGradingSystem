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

        ul{
            display: flex;
            border-top:4px solid white;
            list-style: none;
            padding: 10px 1px;
            background-color:rgb(163, 182, 248);
        }
        ul li a{
            text-decoration: none;
            font-size: larger;
            font-family: Cambria;
            font-weight: bold;
            padding: 10px 12px;
            color:rgb(92, 36, 36);
            transition: all .4s;           
        }

       #l1, a:hover{
            color: white;
            /* background-color:rgb(172, 129, 253); */
            /* border-top: 4px solid rgb(24, 44, 99); */
            
        }
       #l1{
            color: white;
            background-color:rgb(172, 129, 253);
            border-top: 4px solid rgb(24, 44, 99);
            
        }
        a:active{
            color:black;            
        }
   .box{
       margin: 30px 0px;
       display: flex;
       justify-content: center;
   }
    
   table,td,th,input,select{
       text-align: left;
       font-size: large;
       font-family: Cambria;
       font-weight: bolder;
       padding: 5px 10px;
       margin: 1px 10px;
       border-radius: 4px;
   }
   #enroll{
       width:275px;
       
   }
   form{
        padding: 5px 1px;
       border: 4px outset rgb(76, 74, 190);
       border-radius: 12px;
   }
    caption{
        font-size: 3rem;
        text-shadow: 2px 2px 4px black;
        margin: 6px;
        color: blueviolet;
    }
  
   </style>
</head>

<body>

    
    <h1>ADMIN PAGE</h1>
     <ul>
         <li><a  href="adminPage.html">AddStudent</a></li>
         <li><a id="l1" href="">AddResult</a></li>
         <li><a href="showStudent.jsp">ShowStudent</a></li>
         <li><a href="showResult.jsp">ShowResult</a></li>
         <li><a  href="Graph.jsp">Graph</a></li>
         <li><a href="index.html">Logout</a></li>
     </ul>
     <div class="box">
     <form action="addResult.jsp" method="post">
     <table>
         <caption>Add Student Result</caption>  
 <%@page import="java.sql.*" %>
                <tr>
             <th>Enrollment No :</th>
             <td><select id="enroll" name="senroll">
        <%
          try{
                      
              Class.forName("com.mysql.jdbc.Driver");
              Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultdata","root","");
              Statement st = cn.createStatement();  
              ResultSet rs = st.executeQuery("select * from student where status=0 ");
              
              while(rs.next()){
               %>

                 <option value="<%= rs.getLong(1) %>" ><%= rs.getLong(1) %></option>
              
        

      <% 
                   }
          }catch(Exception e){
              System.out.println(e);
          }    
        %>
           </select></td>
          
         </tr> 
         <tr>
             <th>Theory Of Computation :</th>
             <td><input type="number"   name="toc" required></td>
         </tr>  
         <tr>
             <th>Microprocessor And Interfacing :</th>
             <td><input type="number"  name="mpi" required></td>
         </tr>  

         <tr>
             <th>Internet Of Things :</th>
             <td><input type="number"  name="iot" required></td>
         </tr>  
         <tr>
             <th>Web Programming :</th>
             <td><input type="number"  name="wp" required></td>
         </tr>  
         <tr>
             <th>Data Mining :</th>
             <td><input type="number"  name="dm" required></td>
         </tr>  
         <tr>
             <th>Advance Java Programming :</th>
             <td><input type="number"  name="ajp" required></td>
         </tr>  
         <tr>
             <th>IPDC :</th>
             <td><input type="number"  name="ipdc" required></td>
         </tr>  
         <tr>
             <th>DE-2B :</th>
             <td><input type="number"  name="de" required></td>
         </tr>  
        <tr>
            <th></th>
            <td><input type="submit"  value="Add"><input type="reset"></td>
        </tr> 

     </table>
     </form>
    </div>
</body>

</html>