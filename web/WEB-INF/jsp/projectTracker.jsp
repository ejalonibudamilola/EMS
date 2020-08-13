<%-- 
    Document   : projectTracker
    Created on : Mar 23, 2020, 12:08:38 PM
    Author     : franc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="card">
    <div class="card-header">
        Weekly Project Report
    </div> 
    <div class="modal-body">
        <div class="" style="color: red">
             ${uploadstatus}
            <span id="filevalidation" class="error" font-weight-bold></span>
        </div>
        <div class="row">
            <div class="col-md-7">
                <form action="uploadprojectTracker" method="post" name="ProjectTracker" enctype="multipart/form-data">                                        
                    <label>Upload Report</label>
                    <p><input style="color:red" id="file" name="file" type="file"/></p>
                    <button class="btn btn-primary" onclick="return ValidateForm()" id="uploadprojectTracker" type="button">Upload</button>
<!--                    <button class="btn btn-primary" onclick="return ValidateForm()" id="uploadpicture" type="button">Upload</button>-->
                </form>
            </div>
            <div class="col-md-5">
                <img style="width:100%" src="<spring:url value="resources/img/projecttracker.png"/>">
            </div>
        </div>                
    </div>
</div>
            
<script>
       function ValidateForm(){
        console.log("Validating");        
        var valid = true;
        var file1= ProjectTracker.file.value;
        var file = file1.toLowerCase();
        console.log("file is "+file);
//        var FileSize = file.files[0].size / 1024 / 1024; // in MB
        var Filecheck = document.getElementById("file").files[0];
        console.log("File size is "+Filecheck);
        var reg = /(.*?)\.(xls|xlsx|csv)$/;
        removeMessage();
       if(file===""){
           document.getElementById("filevalidation").innerHTML="You forgot to attach an image";
//    	   alert("You forgot to attach file!");
    	   valid=false;
       }
       else if(!file.match(reg)){
           document.getElementById("filevalidation").innerHTML="Please upload a valid excel file";
//    	   alert("Please upload an image file");
    	   valid=false;
       }        
       else if (Filecheck.size > 1048576){ // 1 mb for bytes.
           document.getElementById("filevalidation").innerHTML="Image file must not exceed 1mb";
//            alert("File size must under 2mb!");
            valid=false;   
        }
       return valid;
    }
    
    function removeMessage(){
        var eremove = document.querySelectorAll(".error");
        [].forEach.call(eremove, function(el){
            el.innerHTML="";
            console.log("removed now");
        });
    }
</script>
   
<!--     $(document).on('click', '#uploadprojectTracker', function (e) {
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
                      $('#main').html(response);
                    }				
		});
                }
               
            });-->