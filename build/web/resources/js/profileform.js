/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//Validate profile form
 function ValidateForm(event){
     
     alert("I am inside the profile form javascript file");
  console.log("Validating");        
	var f=document.getElementById("firstname").value;
        console.log(f);
	var l=document.FormProfile.lastname.value;
        console.log(l);
	var e=document.FormProfile.email.value; 
        var o=document.FormProfile.officialemail.value;
        var ph=document.regForm.pnumber.value;
        var ph2=document.regForm.pnumber2.value;
        var j=document.regForm.jobtitle.value;
        var d=document.regForm.dept.value;
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
                
                return valid;
	}
	 if(!letter.test(l)){
             event.preventDefault();
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
        if (d==="Choose..."){
            document.getElementById("department").innerHTML="Please select your department";
            valid=false;
	}
        event.preventDefault();
          return valid;
}
 function removeMessage(){
            var eremove = document.querySelectorAll(".error");
            [].forEach.call(eremove, function(el){
                el.innerHTML="";
            });
        }