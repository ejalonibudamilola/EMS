<%-- 
    Document   : projectReportDashbord
    Created on : May 2, 2020, 3:17:31 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<div class="card">
    <div class="card-header">
        Report Management
    </div> 
    <div class="modal-body">
          <div class="row">
          <div class="col-md-3">
            <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#modalDel"> -Delete </button>
         </div> 
         <div class="col-md-9">
                <form action="searchReport" method="post">
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
                            <option value="username">Staff Username</option>
                            <option value="job_title">Staff Jobtitle</option>
                            <option value="dateuploaded">Date Uploaded</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Enter search details" name="search_string" id="search_string">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id="searchReport" type="button">Search</button>
                        </div>
                    </div>
                </form>
            </div>
     </div>

 <div class="table-responsive">
                        <div class="col-md-12 my-3">${pagination}</div>
                        <table class="table table-striped staffList">
                            <thead class="sticky-top">
                                <tr>
                                    <!--<th><input type="checkbox" class="masterCheck"></th>-->
                                    <th></th>
                                    <th>S/N</th> 
                                    <th>Staff LastName</th>
                                    <th>Staff FirstName</th>
                                    <th>Staff Department</th>
                                    <th>Staff JobTitle</th>
                                    <th>Staff Username</th>
                                    <th>Report</th>
                                    <th>Upload Date</th>
                                </tr>
                            </thead>
                            <tbody>
                <c:set var="report" value="${report}" />                
		<c:forEach var="report" items="${report}" varStatus="status">
                <tr> 
                    <th>
                        <input type="checkbox" class="reportBox">
                        <input type="hidden" value="${report.id}">
                    </th>
                    <th scope="row">${status.count + (page_num - 1)* 10}</th>
                    <td>${report.lastname}</td>
                    <td>${report.firstname}</td>
                    <td>${report.dept}</td>                    
                    <td>${report.jobtitle}</td> 
                    <td>${report.username}</td>                    
                    <td> <a href="<spring:url value="/projecttracker/${report.filename}"/>"><button type="button" class="btn btn-primary">REPORT</button></a></td>                    
                    <td>${report.dateuploaded}</td>
                </tr>
                </c:forEach>
                        
                            </tbody>
                        </table>
                <div class="col-md-12 my-3">${pagination}</div>
                    </div>
                    
 <div class="modal fade" id="modalDel" tabindex="-1" role="dialog" data-backdrop="true" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
          <h5>Are you sure you want to delete this Report</h5>
           <div id="deleteReport"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="spc btn btn-primary" id="deleteReport" data-dismiss="modal">Yes</button>
        <button type="button"  class="btn btn-danger btn-primary link" data-dismiss="modal" >No</button>
      </div>
    </div>
  </div>
</div>
    </div>
</div>

                    
                    
                    

