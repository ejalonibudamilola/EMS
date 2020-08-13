<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <c:set var="profilee" value="${profile}"/>
    <div class="card-header">Profile Page</div> 
    <div class="modal-body">
        <div class="row">
            <div class="col-md-3">
                <c:forEach var="profile" items="${profile}">
                    <img style="width:100%; height:80%;" src="<spring:url value="/profileimages/${profile.imgname}"/>"> 
                </c:forEach>
            </div>
            <div class="col-md-9"> 
<!--                <h5 style="background-color: #00000008;" class="text-center">Personal Information</h5>-->
                <c:forEach var="profile" items="${profile}">
                    <p class="grey-text"><strong>Name:</strong> ${profile.lastname} ${profile.firstname}</p>
                    <p class="grey-text"><strong>Job Title:</strong> ${profile.jobtitle}</p>
                    <p class="grey-text"><strong>Department:</strong> ${profile.dept}</p>
                    <p class="grey-text"><strong>Mobile Number:</strong> ${profile.pnumber}, ${profile.pnumber2}</p>
                    <p class="grey-text"><strong>Email Address:</strong> ${profile.email}</p>
                    <p class="grey-text"><strong>Official Email Address:</strong> ${profile.officialemail}</p>
<!--                    <p class="grey-text"><strong>Contact Address:</strong> ${profile.address}</p>-->
                </c:forEach>                    
            </div>
        </div>
        
        <div class="modal-body">
            <div class="row">
                <div class="col-md-4">
                   <a class="btn btn-primary link" href="editprofile">Edit Profile Data</a> 
                </div>
                <div class="col-md-5"></div>
                <div class="col-md-3">
                    <a class="btn btn-primary link" href="editprofilepicture">Edit Profile Picture</a>
                </div>
            </div>
        </div>
<!--        <div class="row">
            <div class="col-md-12"> 
                <h5 style="background-color: #00000008; margin: 2%" class="text-center">Next of Kin's Information</h5>
                <c:forEach var="profile" items="${profile}">
                    <p class="grey-text"><strong>Name of Next of Kin:</strong> ${profile.nklastname} ${profile.nkfirstname}</p>
                    <p class="grey-text"><strong>Next of Kin's Phone number:</strong> ${profile.npnumber}, ${profile.npnumber2}</p>
                    <p class="grey-text"><strong>Next of Kin's Address:</strong> ${profile.nkaddress}</p>                    
                </c:forEach>                    
            </div>
        </div>-->
        <div class="row">
            <div class="col-md-6">
                <div class="modal-body">
                    <div class="card">
                        <div class="card-header">
                            Recent Leave Requested
                        </div>                
                        <div class="card-body">
                            <c:set var="leave" value="${leave}" />                
                            <c:forEach var="leave" items="${leave}">
                            <p class="grey-text">Leave Number of Days: ${leave.duration}</p>
                            <p class="grey-text">Start Date: ${leave.lsd}</p>
                            <c:choose>
                                <c:when test= "${leave.leave_status eq 0}">
                                    <p class="grey-text">Status: Pending</p>
                                </c:when>
                                <c:when test= "${leave.leave_status eq 1}">
                                    <p class="grey-text">Status: Approved</p>
                                </c:when>
                                <c:otherwise>
                                   <p class="grey-text">Status: Disapproved</p>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test= "${leave.leave_review_date == null}">
                                    <p class="grey-text">Date Reviewed: Not Yet Reviewed</p>
                                </c:when>                                
                                <c:otherwise>
                                   <p class="grey-text">Date Reviewed: ${leave.leave_review_date}</p>
                                </c:otherwise>
                            </c:choose>                           
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
                            
<!--            <div class="col-md-4"></div>-->
            
            <div class="col-md-6">
                <div class="modal-body">
                    <div class="card">
                        <div class="card-header">
                          Recent Loan Requested
                        </div>                
                        <div class="card-body">
                            <c:set var="staffLoan" value="${staffLoan}" />                
                            <c:forEach var="staffLoan" items="${staffLoan}">
                            <p class="grey-text">Loan Amount Requested: #${staffLoan.loanamount}</p>
                            <c:choose>
                                <c:when test= "${staffLoan.loanstatus eq 0}">
                                    <p class="grey-text">Status: Pending</p>
                                </c:when>
                                <c:when test= "${staffLoan.loanstatus eq 1}">
                                    <p class="grey-text">Status: Approved</p>
                                </c:when>
                                <c:otherwise>
                                   <p class="grey-text">Status: Disapproved</p>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test= "${staffLoan.loanreviewdate == null}">
                                    <p class="grey-text">Date Reviewed: Not Yet Reviewed</p>
                                </c:when>                                
                                <c:otherwise>
                                   <p class="grey-text">Date Reviewed: ${staffLoan.loanreviewdate}</p>
                                </c:otherwise>
                            </c:choose> 
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            
<!--            <div class="col-md-4">
                <div class="modal-body">
                    <div class="card">
                        <div class="card-header">
                            Project Tracker
                        </div>                
                        <div class="card-body">                        
                            <p class="grey-text">Total Number of 2020 Leave Days: 21days</p>
                            <p class="grey-text">Used Number of 2020 Leave Days: 0days</p>
                            <p class="grey-text">Available Leave Days in 2020: 21days</p>
                        </div>
                    </div>
                </div>
            </div>            -->
        </div>
    </div>
</div>
