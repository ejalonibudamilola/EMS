<%-- 
    Document   : leaveReview2
    Created on : Apr 14, 2020, 3:41:15 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="card">
    <div class="card-header">
        Staff Leave Management
    </div> 
    <div class="modal-body">
        <div class="row">
         <div class="col-md-4">
             <a href="leavemanagement" class="btn btn-primary link">Back</a>
            <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#modalDel"> -Delete </button>
         </div>        
         <div class="col-md-8">
                <form action="searchLeaveByAdmin" method="post">
                    <span id="cpass" style="color:red;"></span>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"> 
                            <label class="input-group-text" for="inputGroupSelect01">Search by</label>
                        </div>
                        <select class="custom-select" id="search_by" name="search_by">
                            <option selected="">Choose...</option> 
                            <option value="lastname">Staff Lastname</option>
                            <option value="firstname">Staff Firstname</option>
                            <option value="department">Staff Department</option>
                            <option value="jobtype">Staff Jobtype</option>
                            <option value="leave_request_date">Request Date</option>
                            <option value="leave_duration">Duration</option>
                            <option value="leave_start_date">StartDate</option>
                            <option value="leave_end_date">EndDate</option>
                            <option value="reason_for_leaverequest">Reason for Leave Request</option>
                            <option value="username">Staff Username</option>
                            <option value="leave_status">Status</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Enter search details" name="search_string" id="search_string">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id="searchLeaveByAdmin" type="button">Search</button>
                        </div>
                    </div>
                </form>
            </div>
     </div>
         <div class="table-responsive" style="margin-top: -2%">
                        <div class="col-md-12 my-3">${pagination}</div>
                        <table class="table table-striped">
                            <thead class="sticky-top">
                                <tr>  
                                    <th></th>
                                    <th>S/N</th>                                    
                                    <th>Staff Lastname</th>
                                    <th>Staff Firstname</th>
                                    <th>Staff Department</th>
                                    <th>JobType</th>
                                    <th>Request Date</th>
                                    <th>Duration</th>
                                    <th>StartDate</th>
                                    <th>EndDate</th>
                                    <th>Reason for Leave Request</th>
                                    <th>Staff Username</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                <c:set var="leave" value="${leave}" />                
		<c:forEach var="leave" items="${leave}" varStatus="status">
                <tr>
                     <th>
                        <input type="checkbox" class="leaveBox">
                        <input type="hidden" value="${leave.id}">
                    </th>
                    <th scope="row">${status.count + (page_num - 1)* 10}</th>
                    <td>${leave.lastname}</td>
                    <td>${leave.firstname}</td>
                    <td>${leave.dept}</td>
                    <td>${leave.jobtype}</td>
                    <td>${leave.lrd}</td>
                    <td>${leave.duration}</td>
                    <td>${leave.lsd}</td>
                    <td>${leave.led}</td>
                    <td>${leave.leave_reason}</td>
                    <td>${leave.username}</td>
                    <c:choose>
                        <c:when test= "${leave.leave_status eq 0}">
                            <td><a href="reviewLeave/${leave.id}/${leave.lastname}/${leave.firstname}/${leave.dept}/${leave.jobtype}/${leave.lrd}/${leave.duration}/${leave.lsd}/${leave.led}/${leave.leave_reason}/${leave.username}/" class="btn btn-primary link">Review</a></td>
                        </c:when>
                        <c:when test= "${leave.leave_status eq 1}">
                            <td style="color: green"><strong>APPROVED</strong></td>
                        </c:when>
                        <c:otherwise>
                            <td style="color: red"><strong>DISAPPROVED</strong></td>
                        </c:otherwise>
                    </c:choose>                    
                </c:forEach>
                </tr>
            </tbody>
        </table>
                <div class="col-md-12 my-3">${pagination}</div>
                    </div>
    </div>
</div>


