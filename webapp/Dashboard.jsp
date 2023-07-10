<%@ page session="false" errorPage="session_expired.jsp"  import="java.sql.*,java.io.IOException" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
  
  
    <link rel="shortcut icon" href="images/favicon.ico">
    <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <link href="css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="css/modal.css" rel="stylesheet"/>
	<style type="text/css">
		.bootan{
			position 
		}
	</style>

</head>

<body id="boo">
<%!
HttpSession session=null;
Connection conn=null;
PreparedStatement transaction=null;
PreparedStatement deletetransaction = null;
PreparedStatement rbudget=null;
PreparedStatement texpenses=null;
PreparedStatement ubudget=null;
PreparedStatement ubdate=null;
%>
<%session=request.getSession(false);
if(session.getAttribute("authenticated")==null)
	response.sendRedirect("login.jsp");
%>
<%

    {
    	try {
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/expense_tracker","root","root");
    	transaction = conn.prepareStatement("select * from transaction where uname=? order by tdate desc");
    	deletetransaction = conn.prepareStatement("delete from transaction where tid = ?"); 
    	rbudget=conn.prepareStatement("select sum(tamount) from transaction where tdate>=? and tdate<=? and uname=? group by uname=?");
    	texpenses=conn.prepareStatement("select sum(tamount) from transaction where uname=? group by uname");
    	ubudget=conn.prepareStatement("update budget set amount=? where uname=?");
    	ubdate=conn.prepareStatement("update budget set bdate=? where uname=?");
    	}
    	catch(Exception e)
    	{
    		System.out.println(e);
    	}
 } %>
 <script>
<% if(request.getParameter("did")!=null)
{
 deletetransaction.setString(1,request.getParameter("did"));
 deletetransaction.execute();
}
/* else if(request.getParameter("bamt")!=null)
{
	session.setAttribute("bamount",Double.parseDouble(request.getParameter("bamt")));
	ubudget.setDouble(1, (Double)session.getAttribute("bamount"));
	ubudget.setString(2, (String)session.getAttribute("uname"));
	ubudget.execute();
} */
%>
/* window.location.replace("http://localhost:8080/Expense_Tracker/Dashboard.jsp"); */
</script>
<%
if(request.getParameter("ubamount")!=null && request.getParameter("ubdate")!=null)
{
if(request.getParameter("ubamount").equals("")==false && request.getParameter("ubdate").equals("")==false)
{
	session.setAttribute("bamount", Double.parseDouble(request.getParameter("ubamount")));
	ubudget.setDouble(1, Double.parseDouble(request.getParameter("ubamount")));
	ubudget.setString(2, (String)session.getAttribute("uname"));
	
	session.setAttribute("bdate",java.sql.Date.valueOf(request.getParameter("ubdate")));
	ubdate.setDate(1, (java.sql.Date)session.getAttribute("bdate"));
	ubdate.setString(2,(String)session.getAttribute("uname"));
	
	ubudget.execute();
	ubdate.execute();
}
else if(request.getParameter("ubamount").equals("")==false)
{
	session.setAttribute("bamount", Double.parseDouble(request.getParameter("ubamount")));
	ubudget.setDouble(1, Double.parseDouble(request.getParameter("ubamount")));
	ubudget.setString(2, (String)session.getAttribute("uname"));
	ubudget.execute();
}
else
{
	session.setAttribute("bdate",java.sql.Date.valueOf(request.getParameter("ubdate")));
	ubdate.setDate(1, (java.sql.Date)session.getAttribute("bdate"));
	ubdate.setString(2,(String)session.getAttribute("uname"));
	ubdate.execute();
}
}
%>
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title mt-0" id="myModalLabel">Edit Budget</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                                                
                                                                            </button>
                                                                        </div>
                                                                        <form action="Dashboard.jsp" method="post">
                                                                        <div class="modal-body">
                                                                        <div style="font-size:1.3rem;" class="form-control form-group">
                                                                        <label for="bamount">Enter your new budget amount</label>
                                                                        <input id="bamount" name="ubamount" type="number"/><br>
                                                                        </div>    
                                                                            
                                                                        <div style="font-size:1.3rem;" class="form-group form-control">    
                                                                            <label class="" for="bdate">Enter your new budget date</label>
                                                                            <input class="" id="bdate" type="date" name="ubdate"/>
                                                                        </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">Close</button>
                                                                            <input type="submit" value="Save changes" class="btn btn-primary waves-effect waves-light">
                                                                        </div>
                                                                        </form>
                                                                    </div><!-- /.modal-content -->
                                                                </div><!-- /.modal-dialog -->
                                                            </div>
    <div id="layout-wrapper">
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
                            <img class="rounded-circle header-profile-user" src="./images/user.jpeg"
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
                                 <h4>Dashboard</h4>
                                     <ol class="breadcrumb m-0">
                                         <li class="breadcrumb-item"><a href="Dashboard.jsp">Application</a></li>
                                         <li class="breadcrumb-item active">Dashboard</li>
                                     </ol>
                             </div>
                         </div>
                     </div>
                    </div>
                 </div>
                 <!-- end page title -->    


                <div class="container-fluid" style="position:relative;">
                    <div style="position:fixed;bottom:50px;right:50px;z-index:2;"class="float-end">
                        <a href="transaction.jsp" class="btn btn-success">Add Transaction</a>
                    </div>

                    <div class="page-content-wrapper">


                        <div class="row">
                            <div class="col-xl-8">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="header-title mb-4 float-sm-start">Quick Summary</h4>

                                        <div class="clearfix"></div>
                                       

                                        <div class="row align-items-center">
                                           
                                            <div class="col-xl-12">
                                                <div class="dash-info-widget mt-4 mt-lg-0 py-4 px-3 rounded	">

                                                  

                                                    <div class="media pb-2 mt-2">
                                                    
                                                        <div class="avatar-sm mb-3 mt-2">
                                                            <span class="avatar-title rounded-circle bg-white shadow">
                                                                  <i class="mdi mdi-currency-usd text-primary font-size-18"></i>  
                                                                </span>
                                                        </div>
                                                       <div class="media-body ps-3">

                                                        <h4 class="font-size-20"><%="Rs. "+session.getAttribute("bamount") %></h4>
                                                        <p class="text-muted">Total Monthly Budget
                                                        </p>
                                                       </div>
                                                       
                                                       <div style="width:30%" class=" ps-3">
                                                        <h4 class="font-size-20"><%=session.getAttribute("bdate") %></h4>
                                                        <p class="text-muted mb-0">Current Budget Date</p>
                                                       </div>
                         <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myModal">Edit Budget</button>
                                                    </div>
<%double rsbudget=0;
rbudget.setDate(1,(java.sql.Date)session.getAttribute("bdate"));
rbudget.setDate(2,java.sql.Date.valueOf(((java.sql.Date)session.getAttribute("bdate")).toLocalDate().plusDays(30)));
rbudget.setString(3,(String)session.getAttribute("uname"));
rbudget.setString(4,(String)session.getAttribute("uname"));
ResultSet rst = rbudget.executeQuery();
if(rst.next())
rsbudget = rst.getDouble(1);
%>

                                                    <div class="progress mt-3" style="height: 8px;">
                                                        <div class="progress-bar progress-bar bg-success" role="progressbar" style="width: <%=(rsbudget)/(Double)session.getAttribute("bamount")*100 %>%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="80">
                                                        </div>
                                                        
                                                    </div><br>
													<p class="text-muted" style="font-size:1rem"><%=String.format("%.2f",(rsbudget)/(Double)session.getAttribute("bamount")*100.00) %>% spent of budget</p>
<br>
                                                 

                                                    <div class="media mt-4">
                                                        <div class="avatar-sm mb-2 mt-2">
                                                            <span class="avatar-title rounded-circle bg-white shadow">
                                                                    <i class="mdi mdi-eye-outline text-primary font-size-18"></i>
                                                                </span>
                                                        </div>
                                                       <div class="media-body ps-3">
                                                        <h4 class="font-size-20">Rs. <%=(Double)session.getAttribute("bamount")-rsbudget %></h4>
                                                        <p class="text-muted mb-0">Remaining Budget</p>
                                                       </div>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>


                                    </div>
                                </div>
                            </div>

<%
double tot_expenses=0;
texpenses.setString(1,(String)session.getAttribute("uname"));
ResultSet texp = texpenses.executeQuery();
if(texp.next())
	tot_expenses=texp.getDouble(1);
%>
                            <div class="col-xl-4">
                                <div class="row">
                                    <div class="col-xl-12 col-md-12">
                                        <div class="card ">
                                            <div class="card-body">
                                                <div class="text-center">
                                                    <p class="font-size-22">Total Expense</p>
                                                    <div class="mini-stat-icon mx-auto mb-4 mt-3">
                                                        <span class="avatar-title rounded-circle bg-soft-success">
                                                                <i class="mdi mdi-account-outline text-success font-size-20"></i>
                                                            </span>
                                                    </div>
                                                    <h5 class="font-size-22"><%="Rs. "+tot_expenses %></h5>
                                                </div>
                                            </div>
                                        </div>

                                        
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-12 col-md-12">
                                        <div class="card ">
                                            <div class="card-body">
                                                <div class="text-center">
                                                    <p class="font-size-22">Total Expense From Budget</p>
                                                    <div class="mini-stat-icon mx-auto mb-4 mt-3">
                                                        <span class="avatar-title rounded-circle bg-soft-success">
                                                                <i class="mdi mdi-account-outline text-success font-size-20"></i>
                                                            </span>
                                                    </div>
                                                    <h5 class="font-size-22"><%="Rs. "+rsbudget %></h5>
                                                </div>
                                            </div>
                                        </div>

                                        
                                    </div>
                                </div>                                                               
                            </div>

                        </div>



                            
 <!-- BOTTOM TABLE -->

                        <div class="row">
                            <div class="col-xl-12">
                                <div class="card">
                                    <div class="card-body">
                                    	<div class="mb-5">
                                    		<!-- <div class="float-sm-end">
                                            <ul class="nav nav-pills">
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#">Day</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#">Week</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link active" href="#">Month</a>
                                                </li>
                                                <li class="nav-item">
                                                    <a class="nav-link" href="#">Year</a>
                                                </li>
                                            </ul>
                                        </div> -->
                                        <h4 class="header-title mb-4 col-xl-9">Transactions of the Month</h4>
                                    	</div>
                                    
                                        
                                        <div class="table-responsive">
                                            <table class="table table-centered table-nowrap mb-0" id="transactiontable">
                                                <thead class="thead-light">
                                                    <tr>
                                                        <th>Transaction ID</th>
                                                        <th>Transaction Type</th>
                                                        <th>Category</th>
                                                        <th>Date</th>
                                                        <th>Expense</th>
                                                        <th>Remove</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                     <% transaction.setString(1,(String)session.getAttribute("uname"));
														ResultSet rs = transaction.executeQuery();
                                                      while(rs.next())
                                                      {
                                                    %>
                                                    <tr id=<%=rs.getString(1)%>>
                                                    <td><%= rs.getString(1) %></td>
                                                    <td><%= rs.getString(6) %></td>
                                                    <td><%= rs.getString(4) %></td>
                                                    <td><%= rs.getDate(3) %></td>
                                                    <td><%= "Rs. "+rs.getDouble(2) %>
                                                    <td><button onclick="deletetransaction(this)" class="badge badge-pill badge-soft-danger font-size-14">Delete</button></td>
                                                    
                                                    </tr>
                                                    <%
                                                      }
                                                    %>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- end table-responsive -->
                                    </div>
                                </div>
                            </div>
                        </div>

<!-- BOTTOM TABLE END -->

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
    function deletetransaction(td)
    {
    	var id = td.parentNode.parentNode.id;
    	console.log(id);
    	var index = td.parentNode.parentNode.rowIndex;
    	document.getElementById("transactiontable").deleteRow(index);
    	window.location.replace("http://localhost:8080/Expense_Tracker/Dashboard.jsp?did="+id);
    }
   /*  function editbudget()
    {
    	var amt = prompt("Enter your new budget");
    	  if(amt!=null && isNaN(+(amt)))
    	{
    		alert("Enter a valid amount value");	
    	}
    	 else if(amt!=null)
    	{
    	console.log(amt);
    	window.location.replace("http://localhost:8080/Expense_Tracker/Dashboard.jsp?bamt="+amt);
    	} 
    } */
    </script>
</body>

</html>