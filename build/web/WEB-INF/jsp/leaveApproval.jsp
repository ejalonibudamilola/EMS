<%-- 
    Document   : leaveApproval
    Created on : Mar 19, 2020, 10:54:28 AM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">
        Leave Approval Form
    </div> 
    <div class="modal-body">
        <div class="row">
            <div class="col-md-7">
                <form action="reviewLeaveAction" method="post" name="reviewLeaveAction">
                    <input class="form-control mb-3" type="hidden" name="id" value="${id}">
                    <label>Staff's Name</label>
                    <input class="form-control mb-3" type="text" name="staffname" value="${lastname} ${firstname}">
                    <label>Staff's Department</label>
                    <input class="form-control mb-3" type="text" name="staffdept" value="${dept}">
                    <label>Staff's Job Type</label>
                    <input class="form-control mb-3" type="text" name="staffjobtype" value="${jobtype}">  
                    <label>Leave Request Date</label>
                    <input class="form-control mb-3" type="text" name="loanamount" value="${lrd}">
                    <label>Leave Duration</label>
                    <input class="form-control mb-3" type="text" name="loanamount" value="${duration}">
                    <label>Leave Start Date</label>
                    <input class="form-control mb-3" type="text" name="loanrdate" value="${lsd}">
                    <label>Leave End Date</label>
                    <input class="form-control mb-3" type="text" name="loanpdate" value="${led}">
                    <label>Reason for Leave Request</label>
                    <input class="form-control mb-3" type="text" name="reason" value="${leave_reason}">
                    <label>Staff's Username</label>
                    <input class="form-control mb-3" type="text" name="username" value="${username}">
                    <a href="reviewLeaveAction/${id}/${username}/approve/" class="btn btn-primary link">APPROVE</a>
                    <a href="reviewLeaveAction/${id}/${username}/disapprove/" class="btn btn-danger link">DISAPPROVE</a>
                </form>
            </div>
            <div class="col-md-5">
                <img style="width:100%" src="<spring:url value="resources/img/leave.jpeg"/>">
            </div>
        </div>                
    </div>
</div>
   


