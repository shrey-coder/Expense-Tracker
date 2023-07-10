<%@ page session="false" errorPage="session_expired.jsp" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Show Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesdesign" name="author" />

        <link rel="shortcut icon" href="images/favicon.ico">
        <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <link href="css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />


    </head>


    <body id="boo">

        <%
        HttpSession session = request.getSession();
        if(session.getAttribute("authenticated")==null)response.sendRedirect("login.jsp"); %> 
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
                                <span class="d-none d-xl-inline-block ms-1"><%=session.getAttribute("uname")%></span>
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
                                <h3 class="mt-3 mb-3 font-size-23 text-white"><%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></h3>
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
                                        <h4>Edit Profile</h4>
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="Dashboard.jsp">Application</a></li>
                                            <li class="breadcrumb-item active">Edit Profile</li>
                                        </ol>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->    

                    <form action="edit" method="post" onsubmit="return saveChanges()">
                        <div class="container-fluid">

                            <div class="page-content-wrapper">

                                <div class="row">
                                    <div class="col-12">
                                        <div class="card">
                                            <div class="card-body">

                                                <h2 class="font-size-28 mb-5">User Profile Information</h2>
                                                <div class="row mb-4">
                                                    <label for="example-text-input" class="col-sm-2 col-form-label">Username</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            class="form-control" 
                                                            type="text" 
                                                            name="uname" 
                                                            value="<%=session.getAttribute("uname")%>" 
                                                            disabled
                                                        >
                                                    </div>
                                                </div>
                                                <div class="row mb-4">
                                                    <label for="example-search-input" class="col-sm-2 col-form-label">First Name</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            class="form-control" 
                                                            type="text" 
                                                            name="fname" 
                                                            value="<%=session.getAttribute("fname")%>" 
                                                            required
                                                        >
                                                    </div>
                                                </div>
                                                <div class="row mb-4">
                                                    <label for="example-search-input" class="col-sm-2 col-form-label">Last Name</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            class="form-control" 
                                                            type="text" 
                                                            name="lname" 
                                                            value="<%=session.getAttribute("lname")%>" 
                                                            required
                                                        >
                                                    </div>
                                                </div>
                                                <div class="row mb-4">
                                                    <label for="example-email-input" class="col-sm-2 col-form-label">Email</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            class="form-control" 
                                                            type="email" 
                                                            name="email" 
                                                            value="<%=session.getAttribute("email")%>" 
                                                            required
                                                        >
                                                    </div>
                                                </div>
                                                <div class="row mb-4">
                                                    <label for="example-tel-input" class="col-sm-2 col-form-label">Mobile No.</label>
                                                    <div class="col-sm-10">
                                                        <input 
                                                            class="form-control" 
                                                            type="tel" 
                                                            name="mobile" 
                                                            value="<%=session.getAttribute("mobile")%>" 
                                                            pattern="[6-9]{1}[0-9]{9}" 
                                                            title="Mobile number must contain exactly 10 digits"
                                                            required
                                                        >
                                                    </div>


                                                </div>
                                                <div class="row">
                                                    <div class="col" style="text-align: center">
                                                        <button type="submit" class="btn btn-outline-success btn-lg">Save Changes</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>            
                                    </div> <!-- end col -->
                                </div>
                                <!-- end row -->
                            </div>
                        </div>
                    </form>                           
                    <!-- container-fluid -->
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

            function saveChanges() {
                alert("Changes saved successfully !!!");
                return true ; 
            }

        </script>
    </body>

</html>