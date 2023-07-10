<%@ page session="false" errorPage="session_expired.jsp"  language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"
		 import="java.util.Date" 
		 import="java.text.SimpleDateFormat"
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Transaction</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
  
  
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="stylesheet" href="assets/libs/twitter-bootstrap-wizard/prettify.css">
    <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <link href="css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<style type="text/css">
		.bootan{
			position 
		}
		#upi-stick{
                display: none;
            }
	</style>

</head>

<%
HttpSession session = request.getSession(false);
if(session.getAttribute("authenticated")==null)
	response.sendRedirect("login.jsp");
%>
<body id="boo">
<%-- 
<%
			Calendar c1 = Calendar.getInstance();
			Date current = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
 %> --%>
 
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
                            <h3 class="mt-3 mb-3 font-size-23 text-white text-uppercase"><%=session.getAttribute("fname") %> <%=session.getAttribute("lname") %></h3>
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
			                                 <h4>New Transaction</h4>
			                                     <ol class="breadcrumb m-0">
			                                         <li class="breadcrumb-item"><a href="Dashboard.jsp">Application</a></li>
			                                         <li class="breadcrumb-item active">Transaction</li>
			                                     </ol>
			                             </div>
			                         </div>
			                     </div>
			                    </div>
			                 </div>
			                 <!-- end page title -->    


			         <div class="container-fluid">
                        <div class="page-content-wrapper">			
                                <div class="col-lg-12">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="header-title mb-4">Transaction</h4>
    
                                            <div id="progrss-wizard" class="twitter-bs-wizard">
                                                <ul class="twitter-bs-wizard-nav nav-justified">
                                                    <li class="nav-item wizard-border">
                                                        <a href="#progress-seller-details" class="nav-link" data-toggle="tab">
                                                            <span class="step-number">01. Primary Details</span>
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a href="#progress-confirm-detail" class="nav-link" data-toggle="tab">
                                                            <span class="step-number">02. Confirm Detail</span>
                                                        </a>
                                                    </li>
                                                </ul>
    
   <!--  form start -->
    											<form action="newtransaction" method="post">
                                                <div id="bar" class="progress mt-4">
                                                    <div class="progress-bar bg-success progress-bar-striped progress-bar-animated"></div>
                                                </div>
                                                <div class="tab-content twitter-bs-wizard-tab-content">
                                                    <div class="tab-pane" id="progress-seller-details">
                                                            <div class="row">
                                                                <div class="col-lg-8">
                                                                    <div class="mb-3">
                                                                        <label class="form-label" for="progress-basicpill-firstname-input">Teansaction Amount</label><br>
                                                                        <input type="number" class="form-control-lg col-lg-8" name="amount" required>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col-lg-8">
                                                                    <div class="mb-3">
                                                                        <label class="form-label" for="progress-basicpill-lastname-input">Category</label><br>
                                                                        <select class="form-control-lg col-lg-8" name="category" required>
                                                                        	<option value=""  disabled selected="selected">Select Category</option>
                                                                        	<option value="Clothing">Clothing</option>
                                                                        	<option value="Education">Education</option>
                                                                        	<option value="Entertainment">Entertainment</option>
                                                                        	<option value="Food">Food</option>
                                                                        	<option value="Health">Health</option>
                                                                        	<option value="Transportation">Transportation</option>
                                                                        	<option value="Other">Other...</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
    
                                                            <div class="row">
                                                                <div class="col-lg-8">
                                                                    <div class="mb-3">
                                                                        <label class="form-label" for="progress-basicpill-phoneno-input">Date</label><br>
                                                                        <input type="date" class="form-control-lg col-lg-8" name="tdate">
                                                                    </div>
                                                                </div>                                                                
                                                            </div>
                                                            
                                                            <div class="row">
                                                                <div class="col-lg-8">
                                                                    <div class="mb-3">
                                                                        <label class="form-label" for="progress-basicpill-address-input">Note (optional)</label><br>
                                                                        <textarea name="note" class="form-control" rows="2"></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                                <div class="col-lg-8">
                                                                    <div class="mb-5">
                                                                        <label class="form-label" for="progress-basicpill-pancard-input">Payment</label><br>
                                                                        <select name="modeofpayment" class="form-control-lg font-dark col-lg-8" id="modeoftransaction" onchange="paymentMethodChange()" required>
                                                                            <option value="" disabled selected="selected">select method</option>
                                                                            <option class="font-dark" value="Cash">Cash</option>
                                                                            <option class="font-dark" value="UPI">UPI</option>
                                                                            <option class="font-dark" value="Bank Transfer">Bank Transfer</option>
                                                                        </select>
                                                                    
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div id="upi-stick">
                                                                <div class="row">
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            <img src="images/gpay.png" class="img-fluid me-3 shadow-lg p-3" alt="" style="height:192px">
                                                                        </div>
                                                                    </div>
        
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            <img src="images/paytm.png" class="img-fluid me-3 shadow-lg p-3" alt="" style="height:192px">
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="col-lg-4">
                                                                        <div class="mb-3">
                                                                            <img src="images/bhim.png" class="img-fluid me-3 shadow-lg p-3" alt="" style="height:192px">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                 
                                                            </div>
                                                           
                                                        

	                                                        <ul class="pager wizard twitter-bs-wizard-pager-link">
	                                                            <li class="next"><a href="#">Proceed <i class="mdi mdi-arrow-right ms-1"></i></a></li>
	                                                        </ul>
                                                    </div>
                                                    
                                                    
                                                    <div class="tab-pane" id="progress-confirm-detail">
                                                        <div class="row justify-content-center">
                                                            <div class="col-lg-6">
                                                                <div class="text-center">
                                                                    <div class="mb-4">
                                                                        <i class="mdi mdi-check-circle-outline text-success display-4"></i>
                                                                    </div>
                                                                    <div>
                                                                        <h5>Confirm Detail</h5>
                                                                        <p class="text-muted">Make sure that you have added the right details !!!!</p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <ul class="pager wizard twitter-bs-wizard-pager-link">
                                                            <li class="previous"><a href="#"><i class="mdi mdi-arrow-left me-1"></i> Back</a></li>
                                                            <li class="float-end"><button class="btn btn-primary" type="submit">Confirm<i class="mdi mdi-arrow-right ms-1"></i></button> </li>
                                                        </ul>
                                                    </div>
                                                 </div>
                                             	</form>
                                             	
                                             	
                                                </div>
                                              
                                            </div>
                                        </div>
                                    </div>
                        </div>
        
                        
                    </div> <!-- container-fluid -->

            </div>
            <!-- End Page-content -->

        </div>
        <!-- end main content-->

    </div>  

    <script type="text/javascript" src="./js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="./js/jquery.min.js"></script>

    <!-- twitter-bootstrap-wizard js -->
    <script type="text/javascript" src="./js/jquery.bootstrap.wizard.min.js"></script>

    <script type="text/javascript" src="./js/prettify.js"></script>

    <!-- form wizard init -->
    <script type="text/javascript" src="./js/form-wizard.init.js"></script>

     <script type="text/javascript" src="./js/app.js"></script>
    
    <script>
    function temp()
    {
    	const list = document.getElementById("boo").classList;
    	console.log(list);
    	list.toggle("sidebar-enable");
    }
    
    function paymentMethodChange() {
        if (document.getElementById("modeoftransaction").value == "UPI"){
            document.getElementById("upi-stick").style.display = "block";                    
        } 
        
        else{
            document.getElementById("upi-stick").style.display = "none"; 
        }
            
    }
    </script>
</body>

</html>