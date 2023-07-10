<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  	<head>
      <meta charset="UTF-8" />
      <title>Sign Up</title>
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
    </head>
  <body class="">
    <section class="ftco-section register-ftco-section">
      <div class="container register-container">
        <div class="row justify-content-center">
          <div class="col-md-12">
            <div class="wrap d-md-flex">
              <div
                class="text-wrap p-4 p-lg-5 d-flex img"
              >
                <!-- <div class="text w-100">
                  <h2 class="mb-4">Welcome to signup form</h2>
                  <p>
                    Far far away, behind the word mountains, far from the
                    countries Vokalia and Consonantia, there live the blind
                    texts.
                  </p>
                </div> -->
              </div>
              <div class="login-wrap p-4 p-md-5">
              <div class="row closediv"><button class="closebutton" onclick="close()"><i class="fa fa-times closeicon"></i></button></div>
                <div class="row justify-content-center">
                  <div class="col-md-6 text-center mb-2">
                    <h2 class="heading-section">Sign Up User</h2>
                  </div>
                </div>
                <div class="row justify-content-center py-md-3">
                  <div class="col-lg-9">
                    
                    <form action="#" class="signup-form">
                      <div class="row">
                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="label" for="uname">Username</label>
                            <input
                              type="text"
                              class="form-control"
                              name="uname"
                              id = "uname"
                              required
                            />
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="label" for="fname">First Name</label>
                            <input
                              type="text"
                              class="form-control"
                              name="fname"
                              id = "fname"
                              required
                            />
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="label" for="lname">Last Name</label>
                            <input
                              type="text"
                              class="form-control"
                              name="lname"
                              id = "lname"
                              required
                            />
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
                              required
                            />
                          </div>
                        </div>
                        <div class="col-md-12">
                          <div class="form-group">
                            <label class="label" for="password">Password</label>
                            <input
                              type="password"
                              class="form-control"
                              name="password"
                              id = "password"
                              required
                            />
                          </div>
                        </div>
                        <div class="col-md-12 my-4">
                          <div class="form-group">
                            <div class="w-100">
                              <label class="checkbox-wrap checkbox-primary"
                                >I agree all statements in terms of service
                                <input type="checkbox" checked />
                                <span class="checkmark"></span>
                              </label>
                            </div>
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
                    <div class="social-wrap">
                        <p class="or">
                        <span>or</span>
                      </p>
                      <h3 class="mb-3 text-center">
                        Signup with this services
                      </h3>
                      <p class="social-media d-flex justify-content-center">
                        <a
                          href="#"
                          class="social-icon google d-flex align-items-center justify-content-center"
                          ><span class="fa fa-google"></span
                        ></a>
                        <a
                          href="#"
                          class="social-icon facebook d-flex align-items-center justify-content-center"
                          ><span class="fa fa-facebook"></span
                        ></a>
                        <a
                          href="#"
                          class="social-icon twitter d-flex align-items-center justify-content-center"
                          ><span class="fa fa-twitter"></span
                        ></a>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <script type="text/javascript">
  	function close(){
	  var fsection = document.getElementById("uname"); 
	  console.log(fsection);
  }
  </script>
  </body>

</html>
