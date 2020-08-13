<%-- 
    Document   : profile
    Created on : Jan 29, 2020, 2:05:05 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
        <link rel="icon" href="<spring:url value="/resources/img/supersoftLogo.png"/>" type="image/png"/> 
        <link rel="stylesheet" href="<spring:url value="/resources/css/flatpickr.min.css"/>"/>        
        <script src="<spring:url value="/resources/js/jquery.js"/>"></script>
        <script src="<spring:url value="/resources/js/popper.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/mdb.min.js"/>"></script>
        <script src="<spring:url value="/resources/js/flatpickr.js"/>"></script>
<!--        <script src="<spring:url value="/resources/js/profileform.js"/>"></script>-->
        <title>EMS</title> 
         <script>
//            var spinner = ` < div class = "text-center p-5" > < i class = "fa fa-spinner fa-spin" aria - hidden = "true" style = "font-size:100px;" > < /i></div > `;
             var spinner = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin" aria-hidden="true" style="font-size:100px;"></i></div>`;
//                    var interval;
//            function startAutoReload(url) {
//                console.log('call start');
//                interval = setInterval(function () {
//                    $('#result1').html(spinner);
//                    $.get(url, function (result) {
//                        console.log('showing dashboard');
//                        $('#result1').html(result);
//                    });
//                }, 300 * 1000);
//            }

                $(document).ready(function () {
                    $(document).on('click', '.link', function (e) {
                        e.preventDefault();
                    url = $(this).attr('href');
                    var location = url.split('/');
                    location = location[location.length - 1];
                    console.log(location);
                    $('#main').html(spinner);
                    $.get(url, function (result) {
                        $('#main').html(result);
//                        startAutoReload(url);
                        });
                    });
                    });
               
</script>
    </head>
    <body>
           <div class="whole">
            <div class="row">
                <div class="col-md-12 top" style="background: linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.5)),url(<c:url value='/resources/img/bg2e.jpg' />); background-repeat: no-repeat; background-size: cover;">   
                   <div style="margin-top: 10%" class="text-center white-text wow fadeIn">
                        <h1>
                         <strong>EMPLOYEE MANAGEMENT SYSTEM SOFTWARE</strong>
                        </h1>
                        <p>
                          <strong>Best Software for storing and maintaining employee's data</strong>
                        </p>
                    </div>
                </div>
            </div>
            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">${message}</div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <ul class="list-group">
                         <c:choose>
                            <%--<c:when test="${(usertypeid eq 2) && (firstTimer eq 0)}">--%>
                           <c:when test="${(usertypeid eq 2) && (firstTimer eq 0)}">
                                <li class="list-group-item"><a class="link" href="/EMS/viewform" data-toggle="tooltip" title="done with using the channel, you can log out"><i class="fa fa-envelope"></i> Profile Form</a></li>
                            </c:when>
                            <%--<c:when test="${(usertypeid eq 2) && (firstTimer eq 1)}">--%>
                            <c:when test="${(usertypeid eq 2) && (firstTimer eq 1)}">
                                <li class="list-group-item"><a class="link" href="/EMS/profilepage" data-toggle="tooltip" title="done with using the channel, you can log out"><i class="fa fa-user"></i> Profile Page</a></li>
                                ${profileLists}
                            </c:when>
                            <c:when test="${(usertypeid eq 3) && (firstTimer eq 1)}">
                                <li class="list-group-item"><a class="link" href="/EMS/profilepage" data-toggle="tooltip" title="done with using the channel, you can log out"><i class="fa fa-user"></i> Profile Page</a></li>
                                ${profileLists}
                            </c:when>
                            <c:otherwise>
                            ${profileLists}
                            </c:otherwise>
                        </c:choose>            
                        <li class="list-group-item"><a href="<c:url value="/logout" />" data-toggle="tooltip" title="done with using the channel, you can log out"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
<!--                        <li class="list-group-item"><a class="link" href="/EMS/testpicture" >Upload Picture</a></li>-->
                    </ul>
                </div>

                <div class="col-md-9">
                    <div id="main"> 
                        <c:choose>
                            <c:when test="${usertypeid eq 1}">
                                <jsp:include page="staffList.jsp" />
                            </c:when>
                            <c:when test="${(usertypeid eq 3) && (firstTimer eq 0)}">
                                <jsp:include page="profileform.jsp" />
                            </c:when>
                            <%--<c:when test="${(usertypeid eq 3) && (firstTimer eq 1)}">--%>
                                <%--<jsp:include page="staffList.jsp" />--%>
                            <%--</c:when>--%>                            
                            <c:when test="${(usertypeid eq 2) && (firstTimer eq 0)}">
                                <jsp:include page="profileform.jsp" />
                            </c:when>                           
                            <c:otherwise>
                                <jsp:include page="profilepage.jsp" />
                            </c:otherwise>
                        </c:choose>                        
                    </div>
                </div>
            </div>
        </div>
        <footer class="container-fluid text-center">
            <p>Powered by <a href="https://www.naira.com" title="Visit naira.com"><img src="<c:url value="/resources/img/supersoftLogo.png"/>" height="25" alt="Naira Logo" </a></p> 
        </footer>        
       
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>
        <script type="text/javascript">
            var spinner = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin" aria-hidden="true" style="font-size:100px;"></i></div>`;
            
                $(document).on('click', '#profile', function (e) {
                     e.preventDefault();
                     console.log("I am inside profile");
                     var valid = ValidateForm();
                     if(valid===true){
                        $('#main').html(spinner);
                        var form = $(this).closest('form');
                        var data = form.serialize();
//                      var url = 'profileform';
                        var url = "profileform";
                        console.log("are we here");
                        $.get(url, data, function (result) {
                        $('#main').html(result);
                        console.log(url);
                        console.log(result);
                });
                     }
            });
            
            $(document).on('click', '#uploadbtn', function (e) {
                console.log("I am inside profile");
                e.preventDefault();
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
//                var url = 'profileform';
                var url = form.attr('action');
                console.log("are we here");
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
            
            $(document).on('click', '#editprofile', function (e) {
                    console.log("I am inside editprofile");
                e.preventDefault();
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                console.log("are we here");
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            });
            
            $(document).on('click', '#requestloan', function (e) {
                console.log("I am inside loanrequest");
                e.preventDefault();
                var valid = ValidateForm();
                console.log(valid);
                if (valid===true){
                     $('#main').html(spinner);
                    var form = $(this).closest('form');
                    var data = form.serialize();
                    var url = form.attr('action');
                    console.log("are we here");
                    $.get(url, data, function (result) {
                        $('#main').html(result);
                        console.log(url);
                        console.log(result);
                    });
                }               
            });
// This is working but it is redirecting to the login page without taking the data into the main div  //
// 
//            $(document).on('click', '#uploadpicture', function (e) {
//                console.log("I am inside uploadpicture");
//                e.preventDefault();
//                $('#main').html(spinner);
//                var data = new FormData();
//                
//                console.log("are we here");
//                var url = form.attr('action');
//                $.ajax({
////                    url: $(this).attr('action'), 
//                    url: url,
//                    data: data,
//		    cache: false,
//		    contentType: false,
//		    processData: false,
//			type:'POST',
//			success: function(response){
//                        $('#main').html(response);
//                        console.log(url);
//                        console.log(response);
//                    }
//                        });   
//            });


//// End of the working code
//            $(document).on('click', '#uploadpicture', function (e) {
//               e.preventDefault();
//               var valid = ValidateForm();
//               console.log(valid);
//               if (valid===true){
//                   alert("returning true");
//               }
//               else{
//                   alert("returning false");
//               }
//            });
//            

// End of the working code
            $(document).on('click', '#uploadpicture', function (e) {
                var valid = ValidateForm();
                console.log(valid);
                if (valid===true){
                    var form = $(this).closest('form');
               var data = new FormData(jQuery('form')[0]);
               jQuery.each(jQuery('#file')[0].files, function(i, file){
                   data.append('file[]',file);
               });
               console.log("Data is "+data);
		var url = form.attr('action');
                console.log(url);
		jQuery.ajax({
                    url:url,
                    data: data,
		    cache: false,
		    contentType: false,
		    processData: false,
                    method:'POST',
                    type:'POST',
                    success: function(response){                       
//			if(response.Status === 200){
//                            $('#main').html(response);
//					alert(response.SucessfulList);
//			}else{
//                            alert('Error');
//			}
                        $('#main').html(response);
                    }				
		});
                }
               
            });

         $(document).on('click', '#changepasswordbystaff', function (e) {
              e.preventDefault();
              var valid = ValidateForm();
              if (valid===true){
                console.log("I am inside changepasswordbystaff");
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                console.log("are we here");
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
              }                
            });
            
            $(document).on('click', '#changepasswordbyadmin', function (e) {
              e.preventDefault();
              var valid = ValidateForm();
              if (valid===true){
                console.log("I am inside changepasswordbyadmin");
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                console.log("are we here");
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
              }                
            });
            
             $(document).on('click', '#changeadminpasswordbysuperadmin', function (e) {
              e.preventDefault();
              var valid = ValidateForm();
              if (valid===true){
                console.log("I am inside changeadminpasswordbysuperadmin");
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                console.log("are we here");
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
              }                
            });
            
            
            $(document).on('click', '#addstaff', function (e) {
                console.log("I am inside addstaff");
                e.preventDefault();
                 var valid = ValidateForm();
                 if (valid===true){
                    $('#main').html(spinner);
                    var form = $(this).closest('form');
                    var data = form.serialize();
//                   var url = 'profileform';
                    var url = form.attr('action');
                    console.log("are we here");
                    $.get(url, data, function (result) {
                        $('#main').html(result);
                        console.log(url);
                        console.log(result);
                    }); 
                 }
            });
            
            $(document).on('change', '.masterCheck', function () {
                if ($(this).prop('checked') == true) {
                    $('.staffList').find('input:not(.masterCheck)').prop('checked', true);
                } else {
                    $('.staffList').find('input:not(.masterCheck)').prop('checked', false);
                }
            });
            
            var staffArray = [];
            $(document).on('click', '#deleteStaff', function () {
//                $('#modalDel').modal('hide');
//                $('#modalDel').removeClass('fade');
                  $('.modal-backdrop').remove();
                var url = "${pageContext.request.contextPath}/deleteStaff";
                console.log("Staff deletion going on");
                var data = staffArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        console.log("Deletion was successful");
                        alert("Staff successfully deleted");
                        $('#main').html(spinner);
                        var url = "staffmanagement";
                        $.get(url, function (result) {
                            $('#main').html(result);
                        });
                        console.log(result);

                    }
                });
            });
            
              $(document).on('change', '.staffBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    staffArray.push(id);
                } else {
                    if (staffArray.indexOf(id) > -1) {
                        var i = staffArray.indexOf(id);
                        staffArray.splice(i, 1);
                    }
                }
            });
            
             var adminArray = [];
            $(document).on('click', '#deleteAdmin', function () {
//                $('#modalDel').modal('hide');
//                $('#modalDel').removeClass('fade');
                  $('.modal-backdrop').remove();
                var url = "${pageContext.request.contextPath}/deleteStaff";
                console.log("Admin deletion going on");
                var data = adminArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        console.log("Deletion was successful");
                        alert("Admin successfully deleted");
                        $('#main').html(spinner);
                        var url = "adminmanagement";
                        $.get(url, function (result) {
                            $('#main').html(result);
                        });
                        console.log(result);

                    }
                });
            });
            
              $(document).on('change', '.adminBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    adminArray.push(id);
                } else {
                    if (adminArray.indexOf(id) > -1) {
                        var i = adminArray.indexOf(id);
                        adminArray.splice(i, 1);
                    }
                }
            });
            
        $(document).on('click', '#searchStaff', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
    
      $(document).on('click', '#searchAdmin', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
            $(document).on('click', '#requestleave', function (e) {
                console.log("I am inside leaverequest");
                e.preventDefault();
                var valid = ValidateForm();
                console.log(valid);
                if (valid===true){
                     $('#main').html(spinner);
                    var form = $(this).closest('form');
                    var data = form.serialize();
                    var url = form.attr('action');
                    console.log("are we here");
                    $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
                }                
            });
            
            $(document).on('click', '#searchLoanByStaff', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
    $(document).on('click', '#searchLeaveByStaff', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
     $(document).on('click', '#searchLoanByAdmin', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
     $(document).on('click', '#searchLeaveByAdmin', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
     $(document).on('click', '#searchLoanBySuperAdmin', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
     $(document).on('click', '#searchLeaveBySuperAdmin', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
             $(document).on('click', '#editprofilepicture', function (e) {
                var valid = ValidateForm();
                console.log(valid);
                if (valid===true){
                    var form = $(this).closest('form');
               var data = new FormData(jQuery('form')[0]);
               jQuery.each(jQuery('#filee')[0].files, function(i, file){
                   data.append('file[]',file);
               });
               console.log("Data is "+data);
		var url = form.attr('action');
                console.log(url);
		jQuery.ajax({
                    url:url,
                    data: data,
		    cache: false,
		    contentType: false,
		    processData: false,
                    method:'POST',
                    type:'POST',
                    success: function(response){                       
//			if(response.Status === 200){
//                            $('#main').html(response);
//					alert(response.SucessfulList);
//			}else{
//                            alert('Error');
//			}
                        $('#main').html(response);
                    }				
		});
                }
               
            });
            
            $(document).on('click', '#adddept', function (e) {
                console.log("I am inside department");
                e.preventDefault();
                var valid = ValidateForm();
                console.log(valid);
                if (valid===true){
                     $('#main').html(spinner);
                    var form = $(this).closest('form');
                    var data = form.serialize();
                    var url = form.attr('action');
                    console.log("are we here");
                    $.get(url, data, function (result) {
                        $('#main').html(result);
                        console.log(url);
                        console.log(result);
                    });
                }               
            });
            
            $(document).on('click', '#addadmin', function (e) {
                console.log("I am inside addadmin");
                e.preventDefault();
                 var valid = ValidateForm();
                 if (valid===true){
                    $('#main').html(spinner);
                    var form = $(this).closest('form');
                    var data = form.serialize();
                    var url = form.attr('action');
                    console.log("are we here");
                    $.get(url, data, function (result) {
                        $('#main').html(result);
                        console.log(url);
                        console.log(result);
                    }); 
                 }
            });
            
               $(document).on('click', '#uploadprojectTracker', function (e) {
//                $('#uploadprojectTracker').on('click', function (e) {
                   e.preventDefault();
                var valid = ValidateForm();
                console.log(valid);
                if (valid===true){
                    var form = $(this).closest('form');
               var data = new FormData(jQuery('form')[0]);
               jQuery.each(jQuery('#file')[0].files, function(i, file){
                   data.append('file[]',file);
               });
               console.log("Data is "+data);
		var url = form.attr('action');
                console.log(url);
		$.ajax({
                    url:url,
                    data: data,
		    cache: false,
		    contentType: false,
		    processData: false,
                    type:'POST',
                    success: function(response){
                      $('#main').html(response);
                    }				
		});
                }               
            });
            
            $(document).on('click', '#searchReport', function(e){
            e.preventDefault();
            var eq ="They are equal";
            var deq="They are not equal";
            var p="Choose...";
            var s = document.getElementById('search_by').value;
            var ss = document.getElementById('search_string').value;
            console.log(p);
            console.log(s);
            console.log(ss);
            if((p===s)||(ss==="")){
                console.log(eq);
                document.getElementById("cpass").innerHTML="Select a means to Search by";
            }
            else{
                console.log(deq);
                $('#main').html(spinner);
                var form = $(this).closest('form');
                var data = form.serialize();
                var url = form.attr('action');
                $.get(url, data, function (result) {
                    $('#main').html(result);
                    console.log(url);
                    console.log(result);
                });
            }
            
    });
    
     var loanArray = [];
            $(document).on('click', '#deleteLoan', function () {
//                $('#modalDel').modal('hide');
//                $('#modalDel').removeClass('fade');
                  $('.modal-backdrop').remove();
                var url = "${pageContext.request.contextPath}/deleteLoan";
                console.log("Leave deletion going on");
                var data = loanArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        console.log("Deletion was successful");
                        alert("Deleted successfully");
                        $('#main').html(spinner);
                        var url = "loanmanagement";
                        $.get(url, function (result) {
                            $('#main').html(result);
                        });
                        console.log(result);
                    }
                });
            });
            
              $(document).on('change', '.loanBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    loanArray.push(id);
                } else {
                    if (loanArray.indexOf(id) > -1) {
                        var i = loanArray.indexOf(id);
                        loanArray.splice(i, 1);
                    }
                }
            });
            
            var leaveArray = [];
            $(document).on('click', '#deleteLeave', function () {
//                $('#modalDel').modal('hide');
//                $('#modalDel').removeClass('fade');
                  $('.modal-backdrop').remove();
                var url = "${pageContext.request.contextPath}/deleteLeave";
                console.log("Leave deletion going on");
                var data = leaveArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        console.log("Deletion was successful");
                        alert("Deleted successfully");
                        $('#main').html(spinner);
                        var url = "leavemanagement";
                        $.get(url, function (result) {
                            $('#main').html(result);
                        });
                        console.log(result);
                    }
                });
            });
            
              $(document).on('change', '.leaveBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    leaveArray.push(id);
                } else {
                    if (leaveArray.indexOf(id) > -1) {
                        var i = leaveArray.indexOf(id);
                        leaveArray.splice(i, 1);
                    }
                }
            });
            
            var reportArray = [];
            $(document).on('click', '#deleteReport', function () {
//                $('#modalDel').modal('hide');
//                $('#modalDel').removeClass('fade');
                  $('.modal-backdrop').remove();
                var url = "${pageContext.request.contextPath}/deleteReport";
                console.log("report deletion going on");
                var data = reportArray.join(",");
                console.log(data);
                $.post(url, {array: data}, function (result) {
                    if (result === "Successful") {
                        console.log("Deletion was successful");
                        alert("Report successfully deleted");
                        $('#main').html(spinner);
                        var url = "reportmanagement";
                        $.get(url, function (result) {
                            $('#main').html(result);
                        });
                        console.log(result);

                    }
                });
            });
            
              $(document).on('change', '.reportBox', function () {
                var chk = $(this);
                var id = chk.next().val();
                if (chk.prop("checked")) {
                    reportArray.push(id);
                } else {
                    if (reportArray.indexOf(id) > -1) {
                        var i = reportArray.indexOf(id);
                        reportArray.splice(i, 1);
                    }
                }
            });
            
            
            
//             $(document).on('click', '#queryAndInquiry', function (e) {
//                console.log("I am inside queryandassessment");
//                e.preventDefault();
//                 var valid = ValidateForm();
//                 if (valid===true){
//                    $('#main').html(spinner);
//                    var form = $(this).closest('form');
//                    var data = form.serialize();
////                   var url = 'profileform';
//                    var url = form.attr('action');
//                    console.log("are we here");
//                    $.get(url, data, function (result) {
//                        $('#main').html(result);
//                        console.log(url);
//                        console.log(result);
//                    }); 
//                 }
//            });
            
            
//            $(document).on('click', '#queryAndInquiry', function (e) {
//                console.log("I am inside queryandassessment");
//                e.preventDefault();
//                 var valid = ValidateForm();
//                 if (valid===true){
//                     console.log("it is "+valid);
//            $("#queryAndInquiryForm").submit(function(e) {
//                console.log("I am getting the query data");
//                e.preventDefault();    
//                var formData = new FormData(this);
//                 var form = $(this).closest('form');
//                 var url = form.attr('action');
//                $.ajax({
//                    url: url,
//                    type: 'POST',
//                    data: formData,
//                    success: function (data) {
//                        alert(data);
//                    },
//                    cache: false,
//                    contentType: false,
//                    processData: false
//                });
//            });
//        }
//    });   
             $(document).on('click', '#queryAndInquiry', function (e) {
                console.log("I am inside queryandassessment");
                e.preventDefault();
                var form = $(this).closest('form');
		var url = form.attr('action');
                console.log(url);
                var valid = ValidateForm();
                if (valid===true){
                console.log("it is "+valid);
                let uploadqueryfile = $('#uploadqueryfile')[0].files[0];
                console.log("file is "+uploadqueryfile);
                let query = $("#query").val();
                let staffname = $("#staffname").val();               
                         
            if (staffname === "-1") {
                let staffsarray = document.getElementById("staffname");
                let count = 0;
                for (let i = 2; i < staffsarray.length; i++) {
                    let formData = new FormData();
                    if(uploadqueryfile != null) {
                        formData.append('uploadqueryfile', uploadqueryfile);
                    }
                    else{
                        formData.append('uploadqueryfile', new File([""], "null"));
                    }
                    count++;
                    let s = staffsarray.options[i].value;
                    console.log(s);
                    formData.append('query', query);
                    formData.append('staffname', staffsarray.options[i].value);	
                    console.log("form data is "+formData.values());
                    console.log("about to enter ajax call");
                    $.ajax({
                        url : url,
                        type: 'POST',
                        beforeSend: function() {
                        },
                        data: formData,
                        contentType: false,
                        processData: false,
                        dataType: 'json',
                        success : function(response) {
                            if(response.responsecode === "00"){
                            }
                        }
                    });
                }
                if (count === (staffsarray.length - 2)){
                    setTimeout(function() {
                        console.log("done");
                        //window.location.href = "${contextRoot}/home";
                    }, 5000);
                }
            }
            else {
                let formData = new FormData();
		if(uploadqueryfile != null) {
                    formData.append('uploadqueryfile', uploadqueryfile);
                }
                else{
                    formData.append('uploadqueryfile', new File([""], "null"));
                }
                formData.append('query', query);
                formData.append('staffname', staffname);		        
                console.log("form data is "+formData.values());
                console.log("about to enter ajax call");
                $.ajax({
                    url : url,
                    type: 'POST',
                    beforeSend: function() {
                    },
                    data: formData,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    success : function(response) {
                        if(response.responsecode === "00"){                                                
                                setTimeout(function() {
                                    window.location.href = "${contextRoot}/home";
                                }, 5000);
                        }
                    }
                 });
            }
            console.log("I am outside ajax");
			}
                        
    }); 
    </script>
    </body>
</html>
