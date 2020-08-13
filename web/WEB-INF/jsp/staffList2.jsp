<%-- 
    Document   : staffList2
    Created on : Mar 17, 2020, 5:10:56 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="card">
    <div class="card-header">
        Staff Management
    </div> 
    <div class="modal-body">
          <div class="row">
         <div class="col-md-4">
            <a href="staffmanagement" class="btn btn-primary link">Back</a>
<!--            <a href="" data-toggle="modal" data-target="#modalDel"><button class="btn btn-danger" type="submit"> -Delete </button></a>-->
            <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#modalDel"> -Delete </button>
         </div>        
         <div class="col-md-8">
                <form action="searchStaff" method="post">
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
                            <option value="jobtype">Staff Jobtype</option>
                            <option value="job_title">Staff Jobtitle</option>
                        </select>
                        <input type="text" class="form-control" placeholder="Enter search details" name="search_string" id="search_string">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id="searchStaff" type="button">Search</button>
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
                                    <th>Staff Lastname</th>
                                    <th>Staff Firstname</th>
                                    <th>Staff Department</th>
                                    <th>Staff Username</th>
                                    <th>Staff Job Type</th>
                                    <th>Staff Job Title</th>
                                </tr>
                            </thead>
                            <tbody>
                <c:set var="staffs" value="${staffs}" />                
		<c:forEach var="staffs" items="${staffs}" varStatus="status">
                <tr> 
                    <th>
                        <input type="checkbox" class="staffBox">
                        <input type="hidden" value="${staffs.username}">
                    </th>
                    <th scope="row">${status.count + (page_num - 1)* 10}</th>
                    <td>${staffs.lastname}</td>
                    <td>${staffs.firstname}</td>
                    <td>${staffs.dept}</td>
                    <td>${staffs.username}</td>
                    <td>${staffs.jobtype}</td>
                    <td>${staffs.jobtitle}</td>                    
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
          <h5>Are you sure you want to delete this Staff</h5>
           <div id="deleteTest"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="spc btn btn-primary" id="deleteStaff" data-dismiss="modal">Yes</button>
        <button type="button"  class="btn btn-danger btn-primary link" data-dismiss="modal" >No</button>
      </div>
    </div>
  </div>
</div>
    </div>
</div>

                    
                    
                    


