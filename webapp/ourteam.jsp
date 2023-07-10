<%@ page session="false" errorPage="session_expired.jsp" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Our Team</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
  

    <link rel="shortcut icon" href="images/favicon.ico">
    <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <link href="css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

	<style>
		.snoop {
    background: #e8cbc0;
    background: -webkit-linear-gradient(to right, #e5e5e5, #636fa4);
    background: linear-gradient(to right, #e5e5e5, #636fa4);
   /*  min-height: 100vh; */
}

.social-link {
    width: 30px;
    height: 30px;
    border: 1px solid #ddd;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #666;
    border-radius: 50%;
    transition: all 0.3s;
    font-size: 0.9rem;
}

.social-link:hover, .social-link:focus {
    background: #ddd;
    text-decoration: none;
    color: #555;
}
	</style>
</head>

<%
HttpSession session = request.getSession(false);
if(session.getAttribute("authenticated")==null)
	response.sendRedirect("login.jsp");
%>
<body id="boo">

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
                                 <h4>Our Team</h4>
                                     <ol class="breadcrumb m-0">
                                         <li class="breadcrumb-item"><a href="Dashboard.jsp">Application</a></li>
                                         <li class="breadcrumb-item active">Our-Team</li>
                                     </ol>
                             </div>
                         </div>
                     </div>
                    </div>
                 </div>


                <div class="container-fluid">

                        <div class="page-content-wrapper">

	                        <div class="row">
	                                <div class="col-12">
	                                    <div class="card">
	                                        <div class="card-body">
	                                        	    <!-- For demo purpose -->
													<div class="container py-5">
													    <div class="row text-center text-white">
													        <div class="col-lg-8 mx-auto">
													            <h1 class="display-4">Team Page</h1>
													            <p class="lead mb-0 text-dark">We have designed a day-to-day expense management system (Web Application) to easily and efficiently track the daily expenses of user through a computerized system that eliminates the need for manual paper tasks that systematically maintains records and easily accesses data stored by the user.</p>
													            
													          
													        </div>
													    </div>
													</div><!-- End -->
													
													
													<div class="container">
													    <div class="row text-center">
													
													        <!-- Team item -->
													        <div class="col-xl-3 col-sm-6 mb-5">
													            <div class="bg-white rounded shadow-sm py-5 px-4 snoop"><img src="./images/manan.jpg" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
													                <h5 class="mb-0">Manan Patel</h5><span class="small text-uppercase text-muted">Student</span>
													                <ul class="social mb-0 list-inline mt-3">
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-facebook"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-twitter"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-instagram"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-linkedin"></i></a></li>
													                </ul>
													            </div>
													        </div><!-- End -->
													
													        <!-- Team item -->
													        <div class="col-xl-3 col-sm-6 mb-5">
													            <div class="bg-white rounded shadow-sm py-5 px-4 snoop"><img src="./images/shrey.jpg" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
													                <h5 class="mb-0">Shrey Desai</h5><span class="small text-uppercase text-muted">Student</span>
													                 <ul class="social mb-0 list-inline mt-3">
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-facebook"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-twitter"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-instagram"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-linkedin"></i></a></li>
													                </ul>
													            </div>
													        </div><!-- End -->
													
													        <!-- Team item -->
													        <div class="col-xl-3 col-sm-6 mb-5">
													            <div class="bg-white rounded shadow-sm py-5 px-4 snoop"><img src="./images/meet.jpg" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
													                <h5 class="mb-0">Meet Gandhi</h5><span class="small text-uppercase text-muted">Student</span>
													                 <ul class="social mb-0 list-inline mt-3">
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-facebook"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-twitter"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-instagram"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-linkedin"></i></a></li>
													                </ul>													            
													            </div>
													        </div><!-- End -->
													
													        <!-- Team item -->
													        <div class="col-xl-3 col-sm-6 mb-5">
													            <div class="bg-white rounded shadow-sm py-5 px-4 snoop"><img src="./images/vineet.jpg" alt="" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
													                <h5 class="mb-0">Vineet Modi</h5><span class="small text-uppercase text-muted">Student</span>
													                 <ul class="social mb-0 list-inline mt-3">
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-facebook"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-twitter"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-instagram"></i></a></li>
													                    <li class="list-inline-item"><a href="#" class="social-link"><i class="mdi mdi-linkedin"></i></a></li>
													                </ul>
													            </div>
													        </div><!-- End -->
													    </div>
													</div>
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

    <script src="js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.3.1.slim.min.js"></script>
    
    <script>
    function temp()
    {
    	const list = document.getElementById("boo").classList;
    	console.log(list);
    	list.toggle("sidebar-enable");
    }
    </script>
</body>

</html>