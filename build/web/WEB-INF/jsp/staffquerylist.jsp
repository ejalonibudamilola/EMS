<%-- 
    Document   : staffquerylist
    Created on : May 18, 2020, 9:39:11 AM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<div class="card">
    <div class="card-header">
        Query And Inquiry
    </div> 
    <div class="modal-body">
          <div class="row">
<!--         <div class="col-md-4">
            <a href="addqueryandinquiry" class="btn btn-primary link">Add</a>
            <a href="" data-toggle="modal" data-target="#modalDel"><button class="btn btn-danger" type="submit"> -Delete </button></a>
            <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#modalDel"> -Delete </button>
         </div>        -->
<!--         <div class="col-md-8">
                <form name="queryandinquiry" action="queryandinquiryAction" method="post">
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
                        </select>
                        <input type="text" class="form-control" placeholder="Enter search details" name="search_string" id="search_string">
                        <div class="input-group-append">
                            <button class="btn btn-outline-primary btn-sm" id="searchStaff" type="button">Search</button>
                        </div>
                    </div>
                </form>
            </div>-->
     </div>

 <div class="table-responsive">
                        <div class="col-md-12 my-3">${pagination}</div>
                        <table class="table table-striped staffList">
                            <thead class="sticky-top">
                                <tr>
                                    <!--<th><input type="checkbox" class="masterCheck"></th>-->
                                    <th></th>
                                    <th>S/N</th> 
                                    <th>Query/Inquiry</th>
                                    <th>Attachment</th>
                                    <th>Date Sent</th>
                                </tr>
                            </thead>
                            <tbody>
                <c:set var="query" value="${query}" />                
		<c:forEach var="query" items="${query}" varStatus="status">
                <tr> 
                    <th>
                        <input type="checkbox" class="staffBox">
                        <input type="hidden" value="${query.id}">
                    </th>
                    <th scope="row">${status.count + (page_num - 1)* 10}</th>                  
                    <td>${query.query}</td> 
                    ${query.filename}
                    <c:set var="qLength" value="${query.filename}"/>
                    <c:choose>
                        <c:when test="${empty(qLength)}">
                            <td>No File Attached</td>
                        </c:when>
                        <c:otherwise>
                            <td><a href="<spring:url value="/queryAndAssessment/${query.filename}"/>"><button type="button" class="btn btn-primary">Attached File</button></a></td>
                        </c:otherwise>
                    </c:choose>
                    <td>${query.datesent}</td>                    
                </tr>
                </c:forEach>
                        
                            </tbody>
                        </table>
                <div class="col-md-12 my-3">${pagination}</div>
                    </div>
                    

    </div>
</div>

                    
                    
                    

