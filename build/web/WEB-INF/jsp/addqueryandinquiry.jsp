<%-- 
    Document   : queryandinquiry
    Created on : May 15, 2020, 9:39:11 AM
    Author     : franc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">
       Query And Inquiry
    </div> 
    <div class="modal-body">
        <div class="row">
            <div class="col-md-7"> 
                ${status}
                 <form name="queryAndInquiry" id ="queryAndInquiryForm" action="queryAndInquiryAction" method='POST' enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="inputAddress2">Message</label>
                        <textarea type="text" name="query" id="query" class="form-control md-textarea" placeholder="Write your message here..." rows="3" mdbInput></textarea>      
                        <span id="querymessage" class="error" font-weight-bold></span>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Attach a file</label>
                        <p><input style="color:red" id="uploadqueryfile" name="uploadqueryfile" value="" type="file"/></p>
                    </div>
                    <div>
                        <label>Staff Name</label>
                        <c:set var="staffs" value="${staffs}" />
                        <select class="form-control" id="staffname"  name="staffname">
                            <option value="">Select...</option>
                            <option value="-1">All</option>
                            <c:forEach items="${staffs}" var = "staffs">
                                <option value="${staffs.lastname}&${staffs.firstname}&${staffs.username}&${staffs.dept}">${staffs.lastname} ${staffs.firstname}</option>
                            </c:forEach>
                        </select>
                        <span id="sf" class="error" font-weight-bold></span>
                    </div> 
                    <div class="">
                        <button type="button" id="queryAndInquiry" onclick="return ValidateForm()" class="btn btn-primary">Send</button>
                    </div>
                </form>
            </div>
            <div class="col-md-5">
                <img style="width:100%" src="<spring:url value="resources/img/query.png"/>">
            </div>
        </div>                
    </div>
</div>



<script>
    function ValidateForm(){
        console.log("Validating query and assessment form");
        var query = document.getElementById("query").value;
        var staffname = document.getElementById("staffname").value;
        console.log(staffname);
        var pass = /^[a-zA-Z0-9!@#$%^&*()_.]+$/;
        var valid = true;
        removeMessage();
        
       if(query===""){
                event.preventDefault();
                console.log("query sector");
                document.getElementById("querymessage").innerHTML="Please fill this field";
                valid=false;
	}
        
        if(staffname===""){
                event.preventDefault();
                console.log("staffname sector");
                document.getElementById("sf").innerHTML="Please fill this field";
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
    
    
    
//    let img = $('#btn-upload-image')[0].files[0];
//		        let formData = new FormData();
//		        if(img != null) {
//		        	formData.append('file', img);
//				}
//				else{
//					formData.append('file', new File([""], "null"));
//				} 
//		        formData.append('author', author);
//		        formData.append('title', title);
//		        formData.append('category_id', category_id);
//		        formData.append('subcategory_id', subcategory_id);
//		        formData.append('content', content);
//
//				/* let credentials = {
//						"author" : author,
//						"title": title,
//						"category_id": category_id,
//						"subcategory_id": subcategory_id,
//						"content": content
//				}; */
//				$.ajax({
//					url : url,
//	                type: 'POST',
//	                beforeSend: function() {
//	                },
//	                data: formData,
//	                contentType: false,
//	                processData: false,
//	                dataType: 'json',
//	                success : function(response) {
//	                	if(response.responsecode == "00"){
//							$("#responseStatus").html('Post added Successfully<i class="far fa-thumbs-up ml-1"></i>').addClass("animated wobble slower text-success");
//							setTimeout(function() {
//								window.location.href = "${contextRoot}/home";
//							}, 5000);
//						}
//	                }
//				})
//			}
//		})
</script>
