<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="<spring:url value="https://use.fontawesome.com/releases/v5.8.2/css/all.css"/>"/>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="<spring:url value="/resources/css/bootstrap.min.css"/>"/>
        <!-- Material Design Bootstrap -->
        <link rel="stylesheet" href="<spring:url value="/resources/css/mdb.min.css"/>"/>
         <!-- Your custom styles (optional) -->
        <link rel="stylesheet" href="<spring:url value="/resources/css/style.css"/>"/>
        <link rel="icon" href="<spring:url value="/resources/img/emslogo.ico"/>" type="image/png"/>
        <title>EMS</title>
    </head>

    <body>
        <!-- Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
  <div class="container">

    <!-- Brand -->
    <a class="navbar-brand" href="https://mdbootstrap.com/material-design-for-bootstrap/" target="_blank">
      <strong>EMS</strong>
    </a>

    <!-- Collapse -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Links -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

      <!-- Left -->
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home
            <span class="sr-only">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#about">About EMS</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#services">EMS Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#contact">Contact Us</a>
        </li>
      </ul>

      <!-- Right -->
      <ul class="navbar-nav nav-flex-icons">
<!--        <li class="nav-item">
          <a href="https://www.facebook.com/mdbootstrap" class="nav-link" target="_blank">
            <i class="fab fa-facebook-f"></i>
          </a>
        </li>
        <li class="nav-item">
          <a href="https://twitter.com/MDBootstrap" class="nav-link" target="_blank">
            <i class="fab fa-twitter"></i>
          </a>
        </li>
        <li class="nav-item">-->
           
            <a class="nav-link border border-light rounded" data-toggle="modal" data-target="#signIn">
            <i class="fa fa-sign-in mr-2"></i>SIGN IN
          </a>
        </li>
      </ul>
    </div>

  </div>
</nav>
<!-- Navbar -->
 
<!--Carousel Wrapper-->
<div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">

<!--  Indicators
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-1z" data-slide-to="1"></li>
    <li data-target="#carousel-example-1z" data-slide-to="2"></li>
  </ol>
  /.Indicators-->

  <!--Slides-->
  <div class="carousel-inner" role="listbox">

    <!--First slide-->
    <div class="carousel-item active">
      <div class="view" style="background: linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.5)),url(<c:url value='/resources/img/bg2e.jpg' />); background-repeat: no-repeat; background-size: cover;">          
        <!-- Mask & flexbox options-->
        <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

          <!-- Content -->
          <div class="text-center white-text mx-5 wow fadeIn ctext">
            <h1 class="mb-4">
              <strong>EMPLOYEE MANAGEMENT SYSTEM</strong>
            </h1>

            <p>
              <strong>Best Software for storing and maintaining employee's data</strong>
            </p>

            <a href="#about" class="btn btn-outline-white btn-md">
                Learn More
            </a>
          </div>
          <!-- Content -->

        </div>
        <!-- Mask & flexbox options-->

      </div>
    </div>
    <!--/First slide-->

    <!--Second slide-->
    <div class="carousel-item">
      <div class="view" style="background: linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.5)),url(<c:url value='/resources/img/bg3e.jpg' />); background-repeat: no-repeat; background-size: cover;">

        <!-- Mask & flexbox options-->
        <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

          <!-- Content -->
          <div class="text-center white-text mx-5 wow fadeIn ctext">
            <h1 class="mb-4">
              <strong>An Electronic Storage Containing Employee's Data</strong>
            </h1>

             <p>
              <strong>Best Software for storing and maintaining employee's data</strong>
             </p>
            <a href="#services" class="btn btn-outline-white btn-md">
                Explore our Services
            </a>
          </div>
          <!-- Content -->

        </div>
        <!-- Mask & flexbox options-->

      </div>
    </div>
    <!--/Second slide-->

    <!--Third slide-->
    <div class="carousel-item">
      <div class="view" style="background: linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.5)),url(<c:url value='/resources/img/bg4.jpg' />); background-repeat: no-repeat; background-size: cover;">

        <!-- Mask & flexbox options-->
        <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

          <!-- Content -->
          <div class="text-center white-text mx-5 wow fadeIn ctext">
            <h1 class="mb-4">
              <strong>Track Employee's Progress With EMS</strong>
            </h1>

            <p>
              <strong>Best Software for storing and maintaining employee's data</strong>
            </p>

            <a href="#contact" class="btn btn-outline-white btn-md">Reach Us

            </a>
          </div>
          <!-- Content -->

        </div>
        <!-- Mask & flexbox options-->

      </div>
    </div>
    <!--/Third slide-->

  </div>
  <!--/.Slides-->

<!--  Controls
  <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  /.Controls-->

</div>
<!--/.Carousel Wrapper-->

<!--Main layout-->
<div id="about"></div>
<main>
    <div id="about"></div>
  <div class="container">
    <!--Section: Main info-->
    <section class="mt-5 wow fadeIn">
         <h2 style="background-color:#795548; margin-bottom: 4%; color:white; " class="text-center">ABOUT EMS</h2>
      <!--Grid row-->
      <div class="row">
       
        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <img src="<c:url value='/resources/img/officehallway.jpeg' />" class="img-fluid z-depth-1-half"
            alt="">

        </div>
        <!--Grid column-->

        <!--Grid column-->
        <div class="col-md-6 mb-4">

          <!-- Main heading -->
          <h3 class="h3 mb-3">Employee Management System Software</h3>
          <p>This application consists of crucial work related and important personal information about all your employees</p>
          <p>Read details below to learn more about EMS.</p>
          <!-- Main heading -->

          <hr>

          <p>
            <strong>EMS</strong> majorly allows you to keep an
            <strong>electronic record</strong> of your employees, it is an 
            <strong>online inventory </strong> of all employees in various department in an organization.
            It can be <strong>customized</strong> to suit any kind of organization and it can also be used for <strong>personal</strong>
            and <strong>commercial </strong> use.
          </p>

          <!-- CTA -->
<!--          <a href="#" class="btn btn-brown btn-md">Download EMS
            <i class="fas fa-download ml-1"></i>
          </a>
          <a href="#" class="btn btn-brown btn-md">Preview EMS
            <i class="fas fa-image ml-1"></i>
          </a>-->

        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->

    </section>
    <!--Section: Main info-->
  </div>
    <div id="services"></div>       
    <div class="features">
        <div class="container content">
            <h3 class="h3 text-center mb-5">Core Features of EMS</h3>
            
            <!--First row-->
            <div class="row">
                <div class="col-md-6">
                    <div class="col-1 mr-3">
                        <i class="fas fa-code fa-2x indigo-text"></i>
                    </div>
                    <div class="col-10">
                        <h4 class="feature-title">Digital Record of Staff Profile</h4>
                        <p style = "color: #e8f4d6">
                            This application helps get rid of the need of keeping paper file records of Staff, it keeps the
                            record of staff digitally, thereby making it easily accessible and available.
                        </p>
                    </div> 
                </div>                
                  <div class="col-md-6">
<!--                    <div class="col-1 mr-3">
                        <i class="fas fa-graduation-cap fa-2x cyan-text"></i>
                    </div>-->
                    <div class="col-10">
                        <i class="fas fa-question-circle fa-2x cyan-text"></i>
                        <h4 class="feature-title">Query and Complaints</h4>
                        <p style = "color: #e8f4d6">
                            This platform allows employer to be able to pass all queries and complaints to employee.
                            All records of queries and complaints are also kept and be looked up anytime.
                        </p>
                    </div>
                </div>
            </div>
          <!--/First row-->
          
            <!--Second row-->
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="col-1 mr-3">
                        <i class="fas fa-gift fa-2x blue-text"></i>
                    </div>
                    <div class="col-10">
                        <h4 class="feature-title">Leave Management</h4>
                        <p style = "color: #e8f4d6">
                            Employee Management System made requesting for leave digital and more comfortable. 
                            Employee can easily request for leave and Employer easily grant leave request on this application.
                        </p>
                    </div> 
                </div>                
                 <div class="col-md-6">
<!--                    <div class="col-1 mr-3">
                        <i class="fas fa-graduation-cap fa-2x cyan-text"></i>
                    </div>-->
                    <div class="col-10">
                         <i class="fas fa-money-check-alt fa-2x cyan-text"></i>
                        <h4 class="feature-title">Loan Management</h4>
                        <p style = "color: #e8f4d6">
                            Employee Management System made requesting for loan digital and more comfortable. 
                            Employee can easily request for loan and Employer easily grant loan request on this application.
                        </p>
                    </div>
                </div>
            </div>
          <!--/Second row-->
          
          <!--Third row-->
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="col-1 mr-3">
                        <i class="fas fa-book fa-2x blue-text"></i>
                    </div>
                    <div class="col-10">
                        <h4 class="feature-title">Staff Assessment</h4>
                        <p style = "color: #e8f4d6">
                            With Employee Management System, Staff assessment form can be easily passed across employees and filled by them.                            
                        </p>
                    </div>
                </div>
               <div class="col-md-6">
                    <div class="col-1 mr-3">
                        <i class="fas fa-code fa-2x indigo-text"></i>
                    </div>
                    <div class="col-10">
                        <h4 class="feature-title">Staff Performance Analysis</h4>
                        <p style = "color: #e8f4d6">
                            This application enables you be able to monitor the performance of your employees with ease, their work progress 
                            can also be tracked.
                        </p>
                    </div> 
                </div>
            </div>
          <!--/Third row-->
        </div>
        <div class="overlay"></div>  
    </div>  
</main>
<!--Main layout-->

<!--Footer-->
<div id="contact"></div>
<footer class="page-footer font-small mt-2 wow fadeIn">

  <!--Call to action-->
  <div class=" cfooter  text-md-left">

    <!-- Grid row -->
    <div class="row">    

      <hr class="clearfix w-100 d-md-none pb-3">

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase pl-6"><img style="width:15%" src="<spring:url value="/resources/img/emslogo.ico"/>">EMS</h5>
        <h6>Employee Management System</h6>
        <hr style="border:solid 0.5px white; width:100%">
        <p>
            Best Software for storing and maintaining employee's data
    
        </p>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-3 mb-md-0 mb-3">

        <!-- Links -->
        <h5 class="text-uppercase">Quick Links <hr/></h5>

        <ul class="list-unstyled">
          <li>
            <a href="#">Home</a>
            <hr>
          <li>
            <a href="#about">About EMS</a>
            <hr/>
          </li>
          <li>
            <a href="#services">EMS Features</a>
            <hr/>
          </li>
          <li>
            <a href="#contact">Contact Us</a>
            <hr/>
          </li>
        </ul>

      </div>
      <!-- Grid column -->
 <!-- Grid column -->
      <div class="col-md-6 mt-md-0 mt-3">

        <!-- Content -->
        <h5 class="text-uppercase">Send Us A Message</h5>
<!--        <p>Stay connected to us by sending mail to info@supersoft.com.ng, all mails will be treated to the highest level of professionalism</p>-->
        <!-- Extended default form grid -->
<form name="contactForm" action="contactus" method='POST'>
  <!-- Grid row -->
  <div class="form-row">
    <!-- Default input -->
    <div class="form-group col-md-6">
      <label for="firstname">First Name</label>
      <input type="text" class="form-control" name ="firstname" id="firstname" placeholder="First Name">
      <span id="cfirstname" class="error" font-weight-bold></span>
    </div>
    <!-- Default input -->
    <div class="form-group col-md-6">
      <label for="lastname"> Last Name</label>
      <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Last Name">
      <span id="clastname" class="error" font-weight-bold></span>
    </div>
  </div>
  <!-- Grid row -->

  <!-- Default input -->
  <div class="form-group">
    <label for="fromemailaddress">Email Address</label>
    <input type="email" class="form-control" name="fromemail" id="fromemail" placeholder="Email Address">
    <span id="cfromemail" class="error" font-weight-bold></span>
  </div>
  <!-- Default input -->
  <div class="form-group">
      <label for="message">Message</label>
      <textarea type="text" id="emailbody" name ="emailbody" class="form-control md-textarea" placeholder="Write your message here..." rows="3" mdbInput></textarea> 
      <span id="cemailbody" class="error" font-weight-bold></span>
</div>
  <button type="button" id="contactus" class="btn btn-amber btn-md">Send Message</button>
</form>
<!-- Extended default form grid -->
      </div>
 <!-- Grid column -->
    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="bfooter footer-copyright"> Copyright © 2020 <strong>DebraCollections</strong> | Designed by <strong>DebraCollections</strong>
  </div>
  <!-- Copyright -->

</footer>
<!--/.Footer-->

<!-- To change the direction of the modal animation change .right class -->
<div class="modal fade right" id="signIn" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Add class .modal-side and then add class .modal-top-right (or other classes from list above) to set a position to the modal -->
  <div class="modal-dialog modal-side modal-top-right" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <h3 class="white-text">
            <i class="fas fa-user white-text"></i> User Login</h3>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span class="white-text" aria-hidden="true">x</span>
            </button>
      </div>
      <div class="modal-body">
       <!--Form-->
                    <form name="login" action="<c:url value='/j_spring_security_check'/>" method='POST'>
                        <p class="error">${viewe}</p> 
                    <div class="loginform">
<!--                      <div class="card-body">                                             -->
                        <!--Body-->
                        <div style="padding-bottom:5%" class="md-form">
                          <input type="text" name="username" value="" id="username" class="form-control"/>
                          <label for="form2" class="active">Your email</label>
                           <span id="username" class="error" font-weight-bold></span>
                        </div>
                        <div class="md-form">                          
                          <input type="password" name="password" value="" id="password" class="form-control"/>
                          <label for="form2" class="active">Your password</label>
                          <span id="pass" class="error" font-weight-bold></span>
                        </div>
                        <div class="text-center mt-4 register">
                          <button type="submit" class="btn btn-indigo">Log in</button>
                         <a href="" class="btn btn-blue-grey" data-toggle="modal" data-target="#modalRegisterForm">Forgot Password</a>
<!--                          <a href="forgotpass"><button type="button" class="btn btn-blue-grey">Forgot Password</button></a>
                          <a href="forgotpass"><button type="button" class="btn btn-blue-grey" data-toggle="modal" data-target="#modalRegisterForm">Forgot Password</button></a>-->
                          <hr class="hr-light mb-3 mt-4">
                          <div class="inline-ul text-center">
                            <a class="p-2 m-2 tw-ic">
                              <i class="fab fa-twitter white-text"></i>
                            </a>
                            <a class="p-2 m-2 li-ic">
                              <i class="fab fa-linkedin-in white-text"> </i>
                            </a>
                            <a class="p-2 m-2 ins-ic">
                              <i class="fas fa-instagram white-text"> </i>
                            </a>
                          </div>
                        </div>
<!--                      </div>-->
                    </div>
                    </form>
                    <!--/.Form-->  
      </div>      
    </div>
  </div>
</div>
                    
 <div class="modal fade" id="modalRegisterForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Forgot Password</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-user prefix grey-text"></i>
          <input type="text" id="orangeForm-name" class="form-control validate">
          <label data-error="wrong" data-success="right" for="orangeForm-name">Your Username</label>
        </div>   
      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-indigo">Submit</button>
      </div>
    </div>
  </div>
</div>

<!-- Side Modal Top Right -->


        <script src="<spring:url value="/resources/js/jquery-3.4.1.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/popper.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/mdb.min.js"/>"></script>
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
            function ValidateForm(){
        console.log("Validating");     
        var lastname = document.getElementById("lastname").value;
        var firstname = document.getElementById("firstname").value;
        var fromemail= document.getElementById("fromemail").value;
        var emailbody= document.getElementById("emailbody").value;
        var letter = /^[a-zA-Z]+$/;
	var email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var valid = true;
        removeMessage();
        
        if(!letter.test(lastname)){
                event.preventDefault();
                console.log("lastname sector");
                document.getElementById("clastname").innerHTML="Input a valid Lastname";
                valid=false;
	}
        
        if(!letter.test(firstname)){
                event.preventDefault();
                console.log("firstname sector");
                document.getElementById("cfirstname").innerHTML="Input a valid Firstname";
                valid=false;
	}
        
        if(!email.test(fromemail)){
                event.preventDefault();
                console.log("fromemailsector");
                document.getElementById("cfromemail").innerHTML="Input a valid Email Address";
                valid=false;
	}
        
        if(emailbody === ""){
                event.preventDefault();
                console.log("emailbody sector");
                document.getElementById("cemailbody").innerHTML="Please input staff's job title";
                valid=false;
	}      
      
      return valid;
        
    }
    function removeMessage(){
        console.log("can you please remove these errors");
        var eremove = document.querySelectorAll(".error");
        [].forEach.call(eremove, function(el){
            el.innerHTML="";
            console.log("removed now");
        });
    }
          
//                $(selector).click(function)
                $('#contactus').click(function(e){
//                $(document).on('click', '#contactus', function (e) {
                console.log("I am inside contact us");
                e.preventDefault();
                var valid = ValidateForm();
                console.log(valid);
                if (valid===true){
                    var form = $(this).closest('form');
                    var data = form.serialize();
                    var url = form.attr('action');
                    console.log("are we here");
                    $.get(url, data, function (result) {
                        console.log("Ajax call sent");
                        alert(result);
                        console.log(url);
                        console.log(result);
                         location.reload();
                    });
                }               
            });  
        </script>
    </body>
</html>
