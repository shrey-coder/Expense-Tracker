<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta charset="UTF-8" />
    <title>Sign In</title>
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="./css/style1.css" />
    <link rel="stylesheet" href="./css/register.css"/>
    <link rel="stylesheet" href="./css/login.css"/>
  </head>
  <body class="">
    <section class="ftco-section login-ftco-section">
      <div class="container login-container">
        <div class="row justify-content-center">
          <div class="col-md-12">
            <div class="wrap login-main-wrap d-md-flex">
              <div
                class="text-wrap p-4 p-lg-5 d-flex img"
                style="background-image: url(./images/bgimg.avif)"
              >
                <div class="text w-100">
                  <!-- <h2 class="mb-4">Welcome to signin form</h2>
                   <p>
                    Far far away, behind the word mountains, far from the
                    countries Vokalia and Consonantia, there live the blind
                    texts.
                  </p> -->
                </div>
              </div>
              <div class="login-wrap p-4 p-md-5">
              <div class="login-wrap-1">
                <div class="row justify-content-center">
                <div class="col-md-6 text-center">
                 <h2 class="heading-section">USER LOGIN</h2>
                </div>
                </div>
   
                <div class="row justify-content-center login-form">
                  <div class="col-lg-9">
                    <form action="login" method="post" class="signup-form">
                      <div class="row">
                      <%
                        String Display="";
                        if(session.getAttribute("invalid")!=null)
                        	{
                        	Display="block";
                        	session.removeAttribute("invalid");
                        	}
                        else
                        	Display="none";
                        %>
                        <div class="col-md-12 mb-4 mt-4">
                          <div class="form-group mt-1">
                            <label style=" display:<%=Display%>; " class="label invalid" for="loginpassword">Invalid Credentials</label>
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="label" for="loginuname">Username</label>
                            <input type="text" name="username" id="loginuname" class="form-control unameinput" 
                            placeholder="Enter Username" required/>
                          </div>
                        </div>

                        <div class="col-md-12 mb-4">
                          <div class="form-group">
                            <label class="label" for="loginpassword">Password</label>
                            <input type="password" name="password" id="loginpassword" class="form-control passwordinput"
                            placeholder="Enter Password" required/>
                          </div>
                        </div>
                        

                        <div class="col-md-12">
                          <div class="form-group mb-3">
                            <input
                              type="submit"
                              value = "Sign In"
                              class="btn btn-primary submit p-3"
                            >
                          </div>
                        </div>
                      </div>
                    </form>
                    <div class="w-100">
                      <p class="mt-4 register-link">
                        Don't have an account? <a onclick="showregister()" href="#register-ftco-section">Sign Up</a>
                      </p>
                    </div>
                  </div>
                </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <%
                          String display="";
                          String register_display="";
                          String uexists = request.getParameter("uexists");
                          System.out.println(uexists);
                          if(uexists!=null && uexists.equals("true"))
                          {
                        	  uexists = "false";
                        	 System.out.println("In register");
                          	display="block";
                          	register_display="block";
                          }
                          else
                          {
                        	  display="none";
                          }
                          %>
    <section style="display:<%=register_display%>" class="ftco-section register-ftco-section">
      <div class="container register-container">
        <div class="row justify-content-center">
          <div class="col-md-12">

              <!-- <divs
                class="text-wrap p-4 p-lg-5 d-flex img"
              >

              </div> -->
              <div class="login-wrap register-wrap p-4 p-md-5">
              <div class="row closediv"><button class="closebutton" onclick="closeregister()"><i class="fa fa-times closeicon"></i></button></div>
                <div class="row justify-content-center">
                  <div class="col-md-6 text-center mb-2">
                    <h2 class="heading-section">Sign Up User</h2>
                  </div>
                </div>
                <div class="row justify-content-center py-md-3">
                  <div class="col-lg-9">
                    
                    <form action="Prevalidate" method="post" class="signup-form">
                      <div class="row">
                        <div class="col-md-12">
                          <div style="margin-bottom:0" class="form-group">
                            <label class="label" for="registeruname">Username</label>
                            <input
                              type="text"
                              class="form-control"
                              name="uname"
                              id = "registeruname"
                              placeholder="Enter Username" 
                              required
                            />
                          </div>
                          <label id="uexists" style="display:<%=display %>" class="label userexists">User already exists</label>
                        </div>
                        <div class="col-md-12">
                        <div class="row">
                          <div class="form-group col-md-5">
                            <label class="label" for="fname">First Name</label>
                            <input
                              type="text"
                              class="form-control"
                              name="fname"
                              id = "fname"
                              placeholder="Enter First Name" 
                              required
                            />
                          </div>
                          <div class="form-group col-md-6">
                            <label class="label" for="lname">Last Name</label>
                            <input
                              type="text"
                              class="form-control"
                              name="lname"
                              id = "lname"
                              placeholder="Enter Last Name" 
                              required
                            />
                          </div>
                          </div>
                        </div>

                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="label" for="email" for="email"
                              >Email Address</label
                            >
                            <input
                              type="email"
                              class="form-control"
                              name="email"
                              id = "email"
                              placeholder="Enter Email" 
                              required
                            />
                          </div>
                        </div>
                         <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="label" for="mobile"
                                                           >Mobile Number</label
                                                    >
                                                    <input
                                                        type="tel"
                                                        class="form-control"
                                                        name="mobile"
                                                        id = "mobile"
                                                        pattern="^[6-9][0-9]{9}$" 
                                                        maxLength="10"
                                                        title="Please check your mobile number"
                                                        placeholder="Enter Mobile Number" 
                                                        required
                                                        />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="label" for="registerpassword">Password</label>
                                                    <input
                                                        type="password"
                                                        class="form-control"
                                                        name="password"
                                                        id = "registerpassword"
                                                        pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,16}$"
                                                       placeholder="Enter Password" 
                                                        required
                                                        />
                                                </div>
                                            </div>
                        <div class="col-md-12">
                          <div class="form-group">
                            <button
                              type="submit"
                              class="btn btn-primary submit p-3"
                            >
                              Create an account
                            </button>
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
          </div>
        </div>
      </div>
    </section>
    <script type="text/javascript">
    
    function showregister(){
    	var registerform = document.getElementsByClassName("register-ftco-section")[0];
    	registerform.style.display = "block";
    }
  	function closeregister(){
	  var registerform = document.getElementsByClassName("register-ftco-section")[0];
	  document.getElementById("registeruname").value="";
	  document.getElementById("fname").value="";
	  document.getElementById("lname").value="";
	  document.getElementById("email").value="";
	  document.getElementById("mobile").value="";
	  document.getElementById("registerpassword").value="";
	  registerform.style.display = "none";
	  var uxeists = document.getElementById("uexists");
  	  uexists.style.display="none";
  	  window.location="http://localhost:8080/Expense_Tracker/login.jsp";
  }
  	function validation(){
  		document.getElementById("validateuser").innerText = "Resend OTP"
  	}
  </script>
    
  </body>
</html>
