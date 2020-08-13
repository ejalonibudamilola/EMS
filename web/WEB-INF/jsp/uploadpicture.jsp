<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card">
    <div class="card-header">Profile Form</div>
    <div class="modal-body">
        <strong><h5>Complete your registration by uploading your profile picture</h5></strong>
        <div>
            <span id="filevalidation" class="error" font-weight-bold></span>
        </div>
    <form action="uploadprofile" method="post" name="uploadprofilepicture" enctype="multipart/form-data">
            <div class="form-row">                
                <div class="form-group col-md-12">
                    <label>Upload Profile Picture</label>
                    <p><input style="color:red" id="file" name="file" value="" type="file"/></p>
                    <span id="failed" class="error" font-weight-bold></span>
                </div>
            </div>
        
        <div class="modal-body">
            <button class="btn btn-primary" onclick="return ValidateForm()" id="uploadpicture" type="button">Upload</button>
<!--<button class="btn btn-primary"  id="uploadpicture" type="button">Upload</button>-->
        </div>
    </form>
    </div>
</div>

<script>
       function ValidateForm(){
        console.log("Validating");        
        var valid = true;
        var file1= uploadprofilepicture.file.value;
        var file = file1.toLowerCase();
        console.log("file is "+file);
//        var FileSize = file.files[0].size / 1024 / 1024; // in MB
        var Filecheck = document.getElementById("file").files[0];
        console.log("File size is "+Filecheck);
        var reg = /(.*?)\.(jpg|bmp|jpeg|png)$/;
        removeMessage();
       if(file===""){
           document.getElementById("filevalidation").innerHTML="You forgot to attach an image";
//    	   alert("You forgot to attach file!");
    	   valid=false;
       }
       else if(!file.match(reg)){
           document.getElementById("filevalidation").innerHTML="Please upload a valid image file";
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
<!--SELECT * FROM tbl_loan WHERE username='"+username+"' AND loan_request_date IN (SELECT max(loan_request_date) FROM tbl_loan)-->
<!--SELECT * FROM tbl_loan WHERE username='lhabeeb@supersoft.com.ng' ORDER BY loan_request_date DESC LIMIT 1;-->