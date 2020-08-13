<%-- 
    Document   : staffLeaveDashboard
    Created on : Apr 2, 2020, 4:35:03 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="card">
    <div class="card-header">
        Leave Dashboard
    </div> 
    <div class="modal-body">
          <div class="row">
         <div class="col-md-4">
            <a href="leaverequest" class="btn btn-primary link">Request Leave</a>            
         </div>        
         <div class="col-md-8 mt-2">
                <form action="searchLeaveByStaff" method="post">
                    <span id="cpass" style="color:red;"></span>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend"> 
                            <label class="input-group-text" for="inputGroupSelect01">Search by</label>
                        </div>
                        <select class="custom-select" id="search_by" name="search_by">
                            <option selected="">Choose...</option>                             
                            <option value="leave_request_date">Leave Request Date</option>
                            <option value="leave_start_date">Leave Start Date</option>
                            <option value="leave_end_date">Leave End Date</option> 
                            <option value="reason_for_leaverequest">Reason for Leave Request</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Enter search details" name="search_string" id="search_string">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id="searchLeaveByStaff" type="button">Search</button>
                        </div>
                    </div>
                </form>
            </div>
     </div>

 <div class="table-responsive">
                        <div class="col-md-12 my-3">${pagination}</div>
                        <table class="table table-striped">
                            <thead class="sticky-top">
                                <tr>                                    
                                    <th>S/N</th>
                                    <th>Total Leave Days</th>
                                    <th>Leave Request Date</th>
                                    <th>Leave Start Date</th>
                                    <th>Leave End Date</th>
                                    <th>Reason for Leave Request</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                <c:set var="staffLeave" value="${staffLeave}" />                
		<c:forEach var="staffLeave" items="${staffLeave}" varStatus="status">
                <tr>                     
                    <th scope="row">${status.count + (page_num - 1)* 10}</th>                    
                    <td>${staffLeave.duration}</td>
                    <td>${staffLeave.lrd}</td>
                    <td>${staffLeave.lsd}</td>
                    <td>${staffLeave.led}</td>
                    <td>${staffLeave.leave_reason}</td>
                    <c:choose>
                        <c:when test= "${staffLeave.leave_status eq 0}">
                            <td style="color: yellowgreen"><strong>PENDING</strong></td>
                        </c:when>
                        <c:when test= "${staffLeave.leave_status eq 1}">
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
