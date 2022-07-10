<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title> 
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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
        #myChart{
            background-color: white;
            padding: 5px;
            position:relative;
            top:40px;
            left:20%;
        }
    </style>
</head>

<body>
    <h1>ADMIN PAGE</h1>
    <ul>
        <li><a href="adminPage.html">AddStudent</a></li>
        <li><a href="addResultofstudent.jsp">AddResult</a></li>
        <li><a href="showStudent.jsp">ShowStudent</a></li>
        <li><a href="showResult.jsp">ShowResult</a></li>
        <li><a id="l1" href="">Graph</a></li>
        <li><a href="index.html">Logout</a></li>
    </ul>
    <div style="margin-top: 10px; ">
        <button style="background-color:green; padding: 5px;" onclick="tocfun()" id="toc" value="toc">TOC</button>
        <button style="background-color:blue; padding: 5px;" onclick="mpifun()" id="mpi" value="mpi">MPI</button>
        <button style="background-color:yellow; padding: 5px;" onclick="iotfun()" id="iot" value="iot">IOT</button>
        <button style="color:white; background-color:black; padding: 5px;" onclick="wpfun()" id="wp" value="wp">WP</button>
        <button style="background-color:#55B4B0; padding: 5px;" onclick="dmfun()" id="dm" value="dm">DM</button>
        <button style="background-color:red; padding: 5px;" onclick="ajpfun()" id="ajp" value="ajp">AJP</button>
        <button style="background-color:#6B5B95; padding: 5px;" onclick="ipdcfun()" id="ipdc" value="ipdc">IPDC</button>
        <button style="background-color:#B565A7; padding: 5px;" onclick="defun()" id="de" value="de">DE</button>
        <a href="Graph.jsp"> <button style=" color:red; padding: 7px; margin-left: 5px;">Clear All</button></a>

    </div>

<canvas id="myChart" style="max-width:800px"></canvas>
  <%@page import="java.sql.*" %>
        
        
        <%
          try{                         
              Class.forName("com.mysql.jdbc.Driver");
              Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultdata","root","");
              Statement st = cn.createStatement();  
              ResultSet rs = st.executeQuery("select * from result");
                     %> 
              
            
<script>
 var xValues = [];
 var tocValues = [];
 var mpiValues = [];
 var iotValues = [];
 var wpValues = [];
 var dmValues = [];
 var ajpValues = [];
 var ipdcValues = [];
 var deValues = [];

<% while(rs.next()){%>
xValues.push(<%=rs.getInt(1)%>);
tocValues.push(<%=rs.getInt(2)%>);
mpiValues.push(<%=rs.getInt(3)%>);
iotValues.push(<%=rs.getInt(4)%>);
wpValues.push(<%=rs.getInt(5)%>);
dmValues.push(<%=rs.getInt(6)%>);
ajpValues.push(<%=rs.getInt(7)%>);
ipdcValues.push(<%=rs.getInt(8)%>);
deValues.push(<%=rs.getInt(9)%>);
    <%}%>
        
  var toc ={ 
      data: tocValues,
      borderColor: "green",
      fill: false
    };

var mpi = { 
      data: mpiValues,
      borderColor: "blue",
      fill: false
};
    
 var iot = { 
      data: iotValues,
      borderColor: "yellow",
      fill: false
    };

var wp = { 
      data: wpValues,
      borderColor: "black",
      fill: false
    };

var dm = { 
      data: dmValues,
      borderColor: "#55B4B0",
      fill: false
    };

var ajp = { 
      data: ajpValues,
      borderColor: "red",
      fill: false
    };

var ipdc = { 
      data: ipdcValues,
      borderColor: "#6B5B95",
      fill: false
    };

var de ={ 
      data: deValues,
      borderColor: "#B565A7",
      fill: false
    };
 var allcharts = [];

 function tocfun(){

    allcharts.push(toc);

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: allcharts
        },
  options: {
         legend: {display: false}
        }
});}

function mpifun(){

    allcharts.push(mpi);

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: allcharts
        },
  options: {
         legend: {display: false}
        }
});}

function iotfun(){

    allcharts.push(iot);

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: allcharts
        },
  options: {
         legend: {display: false}
        }
});}

function wpfun(){

    allcharts.push(wp);

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: allcharts
        },
  options: {
         legend: {display: false}
        }
});}
function dmfun(){

    allcharts.push(dm);

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: allcharts
        },
  options: {
         legend: {display: false}
        }
});}
function ajpfun(){

    allcharts.push(ajp);

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: allcharts
        },
  options: {
         legend: {display: false}
        }
});}

function ipdcfun(){

    allcharts.push(ipdc);

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: allcharts
        },
  options: {
         legend: {display: false}
        }
});}
function defun(){

    allcharts.push(de);

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: allcharts
        },
  options: {
         legend: {display: false}
        }
});}

</script>
<%
                    
          }catch(Exception e){
              System.out.println(e);
          }    
        %>
        
</body>

</html>