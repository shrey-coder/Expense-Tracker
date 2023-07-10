<%@ page import="java.util.*,classes.App" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

    
    <meta charset="utf-8" />
    <title>OTP verification</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="images/favicon.ico">

    <!-- Bootstrap Css -->
    <link href="css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />


</head>
<body class="authentication-bg bg-primary">
<%
if(session.getAttribute("validated")==null)response.sendRedirect("login.jsp");

if(session.getAttribute("resend")==null)
{
	session.setAttribute("uname",request.getParameter("uname"));
	session.setAttribute("fname",request.getParameter("fname"));
	session.setAttribute("lname",request.getParameter("lname"));
	session.setAttribute("email",request.getParameter("email"));
	session.setAttribute("mobile",request.getParameter("mobile"));
	session.setAttribute("password",request.getParameter("password"));
}
else
{%>
<script>alert("You have enterd an invalid OTP.\nWe have resended the OTP to your email");
</script>
	
<%
	session.removeAttribute("resend");
}
Random otpgenerator = new Random();
String otp = "";
for(int i=0;i<6;i++)
	otp += otpgenerator.nextInt(9);
session.setAttribute("otp",otp);
  App.setSend((String)session.getAttribute("email"),otp);

  %>

    <div class="home-center">
        <div class="home-desc-center">

            <div class="container">

               

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="px-2 py-3">


                                    <div class="text-center">
                                       
                                        <h5 class="text-primary mb-2 mt-4">Verify OTP</h5>
                                        <p class="text-muted"></p>
                                    </div>

                                    <div class="alert alert-success text-center mb-4 mt-4 pt-2" role="alert">
                                        An OTP has been sent on your registered email.
                                    </div>


                                    <form class="form-horizontal" action="Validate" method="post">
            
                                        <div class="mb-3">
                                            <label for="useremail">ENTER OTP</label>
                                            <input name="otp" type="number" class="form-control" id="useremail" placeholder="Enter your OTP">
                                        </div>
                    
                                        <div class="row mb-0">
                                            <div class="col-12 text-end">
                                                <button class="btn btn-primary w-md waves-effect waves-light" type="submit">Submit</button>
                                            </div>
                                        </div>
                                    </form>   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>