<%@ page session="false" errorPage="session_expired.jsp" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*,java.sql.Date" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Ayalysis</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
  
    <link rel="shortcut icon" href="images/favicon.ico">
    <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <link href="css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
<!--     <link href="css/Plot1.css" rel="stylesheet" type="text/css" /> -->


</head>


<body id="boo">


<%
HttpSession session = request.getSession(false);
if(session.getAttribute("authenticated")==null)
	response.sendRedirect("login.jsp");
%>
<%
String dateAfter="",dateBefore="";
String xVal="";
double yVal;
String yearAfter="",yearBefore="",monthAfter="",monthBefore="",dayAfter="",dayBefore="";
String remark="";
String uname=(String)session.getAttribute("uname");
dateAfter = (String) session.getAttribute("dateAfter");
dateBefore = (String) session.getAttribute("dateBefore");

if(dateAfter!=null || dateBefore!=null)
{

	yearAfter = dateAfter.substring(0,4);  // Year of AfterDate
	yearBefore = dateBefore.substring(0,4); // Year of BeforeDate
	
	monthAfter = dateAfter.substring(5,7);  //Month of AfterDate
	monthBefore = dateBefore.substring(5,7);	//Month of BeforeDate
	
	dayAfter = dateAfter.substring(8,10);	// Day of AfterDate
	dayBefore = dateBefore.substring(8,10);	//Day of BeforeDate
}

Gson gsonObj = new Gson(); // Used for converting the Java Object into particular JSON Representation and vice versa.
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	
	//Establishing Connection to Database (1).......
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker","root","root");
	Statement statement = connection.createStatement();
	Statement st = connection.createStatement();
	
	//fetching the username (for temporary purpose) actually username will be taken from session itself
	
	//Query for sum function and fetching data cname and uname and sum
	ResultSet resultSet;
	ResultSet resultSet1=null;
	if(dateAfter==null || dateBefore==null)
	{
		resultSet = statement.executeQuery("select sum(tamount) as sum,cname,uname from transaction group by uname,cname");
		resultSet1 = st.executeQuery("select sum(tamount) as sum from transaction");
	}
	else
	{
		resultSet = statement.executeQuery("select sum(tamount) as sum,cname,uname from transaction where tdate >= CAST('"+yearAfter+"-"+monthAfter+"-"+dayAfter+"' AS DATE) and tdate <= CAST('"+yearBefore+"-"+monthBefore+"-"+dayBefore+"' AS DATE) group by uname,cname");
		resultSet1 = st.executeQuery("select sum(tamount) as sum from transaction where tdate >= CAST('"+yearAfter+"-"+monthAfter+"-"+dayAfter+"' AS DATE) and tdate <= CAST('"+yearBefore+"-"+monthBefore+"-"+dayBefore+"' AS DATE)");
	}
	resultSet1.next();

	if(!resultSet.next())
	{
		xVal = "No Transaction exists";
		yVal = 100;
		map = new HashMap<Object,Object>();
		map.put("x", xVal);
		map.put("y", yVal);
		list.add(map);
		dataPoints = gsonObj.toJson(list);
	}
	else
	{
		if(uname.equals(resultSet.getString("uname")))
		{
			xVal = resultSet.getString("cname");
			yVal = Double.parseDouble(String.format("%.2f",(Double.parseDouble(resultSet.getString("sum"))/Double.parseDouble(resultSet1.getString("sum")))*100));
			map = new HashMap<Object,Object>();
			map.put("x", xVal);
			map.put("y", yVal);
			list.add(map);
			dataPoints = gsonObj.toJson(list);
		}
		while(resultSet.next()){
		if(uname.equals(resultSet.getString("uname")))
		{
			xVal = resultSet.getString("cname");
			yVal = Double.parseDouble(String.format("%.2f",(Double.parseDouble(resultSet.getString("sum"))/Double.parseDouble(resultSet1.getString("sum")))*100));
			map = new HashMap<Object,Object>();
			map.put("x", xVal);
			map.put("y", yVal);
			list.add(map);
			dataPoints = gsonObj.toJson(list);
		}
	}
	}
	connection.close();
}
catch(SQLException e){
	out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
	dataPoints = null;
}

// to draw the graph from the data from the data base connected

%>







    <div id="layout-wrapper">
	 	<% if(session.getAttribute("authenticated")==null)response.sendRedirect("login.jsp"); %>
         <header id="page-topbar">
            <div class="navbar-header">
            
                <div class="d-flex">



                    <button type="button" class="btn btn-sm px-4 font-size-24 header-item waves-effect" id="vertical-menu-btn" onclick="temp()">
                        <i class="mdi mdi-menu"></i>
                    </button>
            
                </div>

                <div class="d-flex">
                    
                    <div class="dropdown d-inline-block">
                        <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="rounded-circle header-profile-user" src="images/user.jpeg"
                                alt="Header Avatar">
                            <span class="d-none d-xl-inline-block ms-1"><%=session.getAttribute("uname") %></span>
                            <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                        </button>
                        
                        <div class="dropdown-menu dropdown-menu-end">
                            <!-- item-->
                            <a class="dropdown-item" href="profile.jsp"><i class="mdi mdi-account-circle-outline font-size-16 align-middle me-1"></i> Profile</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="logout"><i class="mdi mdi-power font-size-16 align-middle me-1 text-danger"></i> Logout</a>
                        </div>
                        
                    </div>
                    
                </div>
            </div>
        </header>

        <!-- ========== Left Sidebar Start ========== -->
        <div class="vertical-menu">

            <div data-simplebar class="h-100">


                <div class="user-sidebar text-center">
                    <div class="dropdown">
                        <div class="user-info">
                            <h3 class="mt-3 mb-3 font-size-23 text-white"><%=session.getAttribute("fname") %> <%=session.getAttribute("lname") %></h3>
                        </div>
                    </div>
                </div>



                <!--- Sidemenu -->
                <div id="sidebar-menu">
                    <!-- Left Menu Start -->
                    <ul class="metismenu list-unstyled" id="side-menu">
                        <li class="menu-title">Menu</li>

                        <li>
                            <a href="Dashboard.jsp" class="waves-effect">
                                <i class="dripicons-home"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <li>
                            <a href="Analysis.jsp" class=" waves-effect">
                                <i class="dripicons-graph-bar"></i>
                                <span>Analysis</span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="editprofile.jsp" class=" waves-effect">
                                <i class="dripicons-user"></i>
                                <span>Edit Profile</span>
                            </a>
                        </li>
                        
                        <li>
                            <a href="ourteam.jsp" class=" waves-effect">
                                <i class="dripicons-user-group"></i>
                                <span>Our Team</span>
                            </a>
                        </li>

                        <li>
                            <a href="logout" class=" waves-effect">
                                <i class="dripicons-power"></i>
                                <span>Logout</span>
                            </a>
                        </li>                        
                    </ul>
                </div>
                <!-- Sidebar -->
            </div>
        </div>
        <!-- Left Sidebar End -->

        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->

		<div class="main-content">

            <div class="page-content">

                <!-- start page title -->
                <div class="page-title-box">
                    <div class="container-fluid">
                     <div class="row align-items-center">
                         <div class="col-sm-6">
                             <div class="page-title">
                                 <h4>Analysis</h4>
                                     <ol class="breadcrumb m-0">
                                         <li class="breadcrumb-item"><a href="Dashboard.jsp">Application</a></li>
                                         <li class="breadcrumb-item active">Analysis</li>
                                     </ol>
                             </div>
                         </div>
                     </div>
                    </div>
                 </div>
                 <!-- end page title -->    


                <div class="container-fluid">

                        <div class="page-content-wrapper">

                            <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
    
                                            <h2 class="font-size-28 mb-5">Expense Analysis</h2>
                                            
                                            <div style="margin-left: 30%; margin-bottom: 7%;font-size:1rem;">
												<form action="getdate">
                                                                                                    <span><b>FROM</b>&nbsp;&nbsp;&nbsp;</span>
													<input type="date" name="dateAfter"/>
													<span style="margin-left:5%; margin-right:1%"><b>TO</b> </span>
													<input type="date" name="dateBefore"/>&nbsp;&nbsp;
                                                                                                        <button style="margin-left:2%" class="btn btn-primary" type="submit" value="Refresh">
                                                                                                            <i class="fa-solid fa-arrows-rotate"></i>Refresh
                                                                                                        </button>
												</form>
											</div>
											
											<div id="chartContainer" style="height:50vh">
											</div>
                                            
    										<script src="https://canvasjs.com/assets/script/canvasjs.min.js">
											</script>
                                        </div>
                                    </div>
                                </div> <!-- end col -->
                            </div>
                            <!-- end row -->
                            

                             <div class="row">
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-body">
    
                                            <div class="table-responsive">
                                            <table class="table table-centered table-nowrap mb-0" id="itemtable">
                                            
                                            
                                            <% 
												// To Displaying the data from the Database.......................
												try{
													//establishing connection with database (2)........
													Class.forName("com.mysql.cj.jdbc.Driver"); 
													Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker", "root", "root");
													Statement statement = con.createStatement();
													
													//Fetching username (temporary purpose) username will come from the session
													
													
													//taking data from database based in the conditions......................
													ResultSet resultSet;	
																
													if(dateAfter==null || dateBefore==null)
													{
														resultSet = statement.executeQuery("select sum(tamount) as sum,cname,uname from transaction group by uname,cname");
													}
													else
													{
														resultSet = statement.executeQuery("select SUM(tamount) as sum,cname,uname from transaction where tdate >= CAST('"+yearAfter+"-"+monthAfter+"-"+dayAfter+"' AS DATE) and tdate <= CAST('"+yearBefore+"-"+monthBefore+"-"+dayBefore+"' AS DATE) group by uname,cname");
													}
														%>
																		
                                            
                                            
                                            
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>Category Name</th>
                                                        <th>Sum</th>
                                                        
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <%		//Starting of the div row tag to display the category and price
																while(resultSet.next())
																{
																	if(uname.equals(resultSet.getString("uname")))
																	{
																		%>
                                                    <tr>
                                                        <td><%out.println(""+resultSet.getString("cname")); %></td>
                                                        <td><%out.println("Rs "+resultSet.getInt("sum"));%></td>
                                                    </tr>

                                                   <%
																	}
																}
																con.close();
													}
													catch(Exception e)
													{
														System.out.println(""+e.getMessage());
													}
													
												%>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- end table-responsive -->
                                            
    
                                        </div>
                                    </div>
                                </div> <!-- end col -->
                            </div>
                            <!-- end row -->
                                       
  

                        </div>
        
                        
                    </div> <!-- container-fluid -->
            </div>
            <!-- End Page-content -->

        </div>
        <!-- end main content-->
		 
	
    </div>  

    <script src="js/bootstrap.bundle.min.js"></script>
    
    <script>
    function temp()
    {
    	const list = document.getElementById("boo").classList;
    	console.log(list);
    	list.toggle("sidebar-enable");
    }
    
    
    
    window.onload = function() { 
    	 
    	<% if(dataPoints!=null) {%>
    		var chart = new CanvasJS.Chart("chartContainer", {
    		animationEnabled: true,
    		exportEnabled: true,
    		title: {
    			text: "Analysis of Expense"
    		},
    		data: [{
    			type: "pie", //change type to bar, line, area, pie, etc
    			toolTipContent: "{x}",
    			indexLabel: "{x},{y}%",
    			dataPoints: <%out.print(dataPoints);%>
    		}]
    	});
    	chart.render();
    	<% } 
    	%> 
    	}
    </script>
</body>

</html> 