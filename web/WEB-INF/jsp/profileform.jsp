<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">
    <div class="card-header">Profile Form</div>
    ${error}
    <form method="post" name="FormProfile" enctype="multipart/form-data">
        <div class="modal-body">    
           <h5 style="background-color: #00000008" class="text-center">Personal Information</h5>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Lastname</label>
                    <input class="form-control" type="text" name="lastname" id="lastname" value="${lastname}" readonly>
                    <span id="last" class="error" font-weight-bold></span>
                </div>
                <div class="form-group col-md-6">
                    <label>Firstname</label>
                    <input class="form-control" type="text" name="firstname" id="firstname" value="${firstname}" readonly>
                    <span id="first" class="error" font-weight-bold></span>
                </div>                
            </div>
            <div class="form-row">
                <div class="form-group col-md-3">
                    <label>Email Address</label>
                    <input class="form-control" type="email" id="email" name="email" value="">
                    <span id="emailaddress" class="error" font-weight-bold></span>
                </div>
                <div class="form-group col-md-3">
                    <label>Official Email Address</label>
                    <input class="form-control" type="email" id="officialemail" name="officialemail" value="${username}" readonly>
                    <span id="oemailaddress" class="error" font-weight-bold></span>
                </div>
                 <div class="form-group col-md-3">
                    <label>Phone Number</label>
                    <input class="form-control" type="text" id="pnumber" name="pnumber" value="">
                    <span id="phonenumber" class="error" font-weight-bold></span>
                </div>
                 <div class="form-group col-md-3">
                    <label>Alternative Phone Number</label>
                    <input class="form-control" type="text" id="pnumber2" name="pnumber2" value="">
                    <span id="phonenumber2" class="error" font-weight-bold></span>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Birth Date</label>
                    <input class="form-control" type="date" name="birthdate" value="">
                </div>
                <div class="form-group col-md-4">
                    <label>Marital Status</label>
                    <select class="custom-select maritals" id="maritals" name="maritals">
                        <option value="">Select</option> 
                        <option value="Single">Single</option>
                        <option value="Married">Married</option>
                        <option value="Divorced">Divorced</option>
                        <option value="Widowed">Widowed</option>
                        <option value="Others">Others</option>
                    </select>
                </div> 
                <div class="form-group col-md-4">
                    <label>Title</label>
                    <select class="custom-select" name="title">
                        <option value="">Select</option>
                        <option value="Miss">Miss</option> 
                        <option value="Mr">Mr</option>
                        <option value="Mrs">Mrs</option>
                    </select>
                </div>
            </div>
              <div style="display:none" class="form-row spouse">
                <div class="form-group col-md-4">
                    <label>Spouse Firstname</label>
                    <input class="form-control" type="text" name="spfirstname" value="">
                </div>
                <div class="form-group col-md-4">
                    <label>Spouse Lastname</label>
                    <input class="form-control" type="text" name="splastname" value="">
                </div>
                <div class="form-group col-md-4">
                    <label>Spouse Phone Number</label>
                    <input class="form-control" type="text" name="spnumber" value="">
                </div>                
            </div>
             <div style="display:none" class="form-row spouse">
                 <div class="form-group col-md-4">
                    <label>Spouse Occupation</label>
                    <input class="form-control" type="text" name="spoccupation" value="">
                </div> 
                <div class="form-group col-md-4">
                    <label>Spouse Place of Work</label>
                    <input class="form-control" type="text" name="spworkplace" value="">
                </div>
                <div class="form-group col-md-4">
                    <label>Spouse Employer</label>
                    <input class="form-control" type="text" name="spemployer" value="">
                </div>        
            </div>
            <div class="form-row">               
                <label for="inputAddress2">Address</label>
                <textarea type="text" class="form-control md-textarea" placeholder="Address" name="address"></textarea>      
            </div>
            
            
            <h5 style="background-color: #00000008" class="text-center mt-4">Job Information</h5>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Job Role/Title</label>
                    <input class="form-control" type="text" id="jobtitle" name="jobtitle" value="${jobtitle}" readonly>
                    <span id="job" class="error" font-weight-bold></span>
                </div>
                <div class="form-group col-md-6">
                    <label>Department</label>
                    <input class="form-control" type="text" id="dept" name="dept" value="${dept}" readonly>
                    <span id="department" class="error" font-weight-bold></span>
                </div>
<!--                <div class="form-group col-md-6">
                    <label>Department</label>
                     <select id="dept" class="custom-select " name="dept">
                        <option value="Choose...">Choose...</option> 
                        <option value="Development Department">Development Department</option> 
                        <option value="Administration Department">Administration Department</option>
                        <option value="Account Department">Account Department</option>
                        <option value="Human Resource Department">Human Resource Department</option>
                    </select>
                    <span id="department" class="error" font-weight-bold></span>
                </div> -->
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Work Start Date</label>
                    <input class="form-control" type="date" name="startdate" value="">
                </div>
                <div class="form-group col-md-6">
                    <label>Job Type</label>
                    <select class="custom-select" id="jobtype" name="jobtype">
                        <option value="">Choose...</option> 
                        <option value="Full Time">Full Time</option> 
                        <option value="Part Time">Part Time</option>
                    </select>                    
                    <span id="vjobtype" class="error" font-weight-bold></span> 
                </div>
            </div>
            <h5 style="background-color: #00000008" class="text-center mt-4">Emergency Contact Information</h5>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Next of Kin's FirstName</label>
                    <input class="form-control" type="text" name="nkfirstname" value="">
                </div>
                <div class="form-group col-md-6">
                    <label>Next of Kin's Lastname</label>
                    <input class="form-control" type="text" name="nklastname" value="">
                </div> 
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Relationship with Next of Kin</label>
                    <input class="form-control" type="text" name="rel" value="">
                </div>
                 <div class="form-group col-md-4">
                    <label>Next of Kin's Phone Number</label>
                    <input class="form-control" type="text" name="npnumber" value="">
                </div>
                 <div class="form-group col-md-4">
                    <label>Alternative Phone Number</label>
                    <input class="form-control" type="text" name="npnumber2" value="">
                </div>
            </div>
            <div class="form-row"> 
                <div class="form-group col-md-12">
                    <label for="inputAddress2">Next of Kin's Address</label>
                    <textarea type="text" class="form-control md-textarea" placeholder="Address" name="nkaddress"></textarea>      
                </div>
            </div>
            
        </div>
        <div class="modal-body">
            <button class="btn btn-primary" onclick="return ValidateForm()" id="profile" type="button">Submit</button>
        </div>
    </form>
</div>

<script>
             $(document).on('change','.maritals', function (e) {
                    e.preventDefault();
                    console.log("I am in this place");
		    var optionSelected = $("option:selected", this);
		    var valueSelected = this.value;
                    console.log(valueSelected);
                    if(valueSelected==="Married"){
                        console.log("if running");
                        $('.spouse').show();
                    }
                    else{
                        console.log("else running");
                       $('.spouse').hide(); 
                    }
                }); 
                
                function ValidateForm(){
  console.log("Validating");        
	var f=document.getElementById("firstname").value;
        console.log(f);
	var l=document.FormProfile.lastname.value;
        console.log(l);
	var e=document.FormProfile.email.value; 
        var o=document.FormProfile.officialemail.value;
        var ph=document.FormProfile.pnumber.value;
        var ph2=document.FormProfile.pnumber2.value;
        var j=document.FormProfile.jobtitle.value;
        var jobtype = document.FormProfile.jobtype.value;
        console.log("Job Title is "+j);
        var d=document.FormProfile.dept.value;
        console.log(d);
        removeMessage();
        var letter = /^[a-zA-Z]+$/;
	var email = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        var number = /^\d{11}$/;
        var word = /^[a-zA-Z\s]+$/;
        var valid = true;
        
        if(!letter.test(f)){
                event.preventDefault();
                console.log("firstname sector");
                document.getElementById("first").innerHTML="First name must be filled";
                valid=false;
	}
	 if(!letter.test(l)){
            document.getElementById("last").innerHTML="Last name must be filled";
            valid=false;
	}	
	 if (!email.test(e)) {
        document.getElementById("emailaddress").innerHTML="Email must be filled";
            valid=false;
	}
         if (!email.test(o)) {
        document.getElementById("oemailaddress").innerHTML="Official Email must be filled";
            valid=false;
	}
        if (!number.test(ph)){
            document.getElementById("phonenumber").innerHTML="Input your eleven digit phone number";
            valid=false;
	}
         if (!number.test(ph2)){
            document.getElementById("phonenumber2").innerHTML="Input your alternative eleven digit phone number";
            valid=false;
	}
         if (!word.test(j)){
            document.getElementById("job").innerHTML="Input your job title";
            valid=false;
	}
         if (!word.test(jobtype)){
            document.getElementById("vjobtype").innerHTML="Please select your jobtype";
            valid=false;
	}
        if (d==="Choose..."){
            document.getElementById("department").innerHTML="Please select your department";
            valid=false;
	}
          return valid;
}
 function removeMessage(){
            var eremove = document.querySelectorAll(".error");
            [].forEach.call(eremove, function(el){
                el.innerHTML="";
            });
        }
      
</script>
        

