<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="card">
    <c:set var="profilee" value="${profile}"/>
    <div class="card-header">Profile Form</div>
    <div class="col-md-4">
        <a href="profilepage" class="btn btn-primary link">Back</a>
    </div>
    
    ${editerror}
    <form action="editprofileaction" method="post" name="EditFormProfile" enctype="multipart/form-data">
        <div class="modal-body">    
             <c:forEach var="profile" items="${profile}">
           <h5 style="background-color: #00000008" class="text-center">Personal Information</h5>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Firstname</label>
                    <input class="form-control" type="text" name="firstname" value="${profile.firstname}" readonly>
                </div>
                <div class="form-group col-md-6">
                    <label>Lastname</label>
                    <input class="form-control" type="text" name="lastname" value="${profile.lastname}" readonly>
                </div> 
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Email Address</label>
                    <input class="form-control" type="email" name="email" value="${profile.email}">
                </div>
                <div class="form-group col-md-6">
                    <label>Official Email Address</label>
                    <input class="form-control" type="email" name="officialemail" value="${profile.officialemail}" readonly>
                </div>
            </div>
            <div class="form-row">
                 <div class="form-group col-md-6">
                    <label>Phone Number</label>
                    <input class="form-control" type="text" name="pnumber" value="${profile.pnumber}">
                </div>
                 <div class="form-group col-md-6">
                    <label>Alternative Phone Number</label>
                    <input class="form-control" type="text" name="pnumber2" value="${profile.pnumber2}">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Birth Date</label>
                    <input class="form-control" type="date" name="birthdate" value="${profile.birthdate}">
                </div>
                <div class="form-group col-md-4">
                    <label>Marital Status</label>
                    <select class="custom-select maritals" id="maritals" name="maritals" value="${profile.maritals}">
                        <option value="${profile.maritals}">${profile.maritals}</option> 
                        <option value="">Change marital status</option> 
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
                        <option value="${profile.title}">${profile.title}</option>
                        <option value="">Change Title</option>
                        <option value="Miss">Miss</option> 
                        <option value="Mr">Mr</option>
                        <option value="Mrs">Mrs</option>
                    </select>
                </div>
            </div>
              <div style="display:none" class="form-row spouse">
                <div class="form-group col-md-4">
                    <label>Spouse Firstname</label>
                    <input class="form-control" type="text" name="spfirstname" value="${profile.spfirstname}">
                </div>
                <div class="form-group col-md-4">
                    <label>Spouse Lastname</label>
                    <input class="form-control" type="text" name="splastname" value="${profile.splastname}">
                </div>
                <div class="form-group col-md-4">
                    <label>Spouse Phone Number</label>
                    <input class="form-control" type="text" name="spnumber" value="${profile.spnumber}">
                </div>                
            </div>
             <div style="display:none" class="form-row spouse">
                 <div class="form-group col-md-4">
                    <label>Spouse Occupation</label>
                    <input class="form-control" type="text" name="spoccupation" value="${profile.spoccupation}">
                </div> 
                <div class="form-group col-md-4">
                    <label>Spouse Place of Work</label>
                    <input class="form-control" type="text" name="spworkplace" value="${profile.spworkplace}">
                </div>
                <div class="form-group col-md-4">
                    <label>Spouse Employer</label>
                    <input class="form-control" type="text" name="spemployer" value="${profile.spemployer}">
                </div>        
            </div>
            <div class="form-row">               
                <label for="inputAddress2">Address</label>
                <textarea type="text" class="form-control md-textarea" placeholder="Address" name="address" value="">${profile.address}</textarea>      
            </div>
            
            
            <h5 style="background-color: #00000008" class="text-center mt-4">Job Information</h5>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Job Role/Title</label>
                    <input class="form-control" type="text" name="jobtitle" value="${profile.jobtitle}" readonly>
                </div>
               <div class="form-group col-md-6">
                    <label>Department</label>
                    <input class="form-control" type="text" id="dept" name="dept" value="${dept}" readonly>
                    <span id="department" class="error" font-weight-bold></span>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Work Start Date</label>
                    <input class="form-control" type="date" name="startdate" value="${profile.startdate}">
                </div>
                <div class="form-group col-md-6">
                    <label>Job Type</label>
                    <select class="custom-select " name="jobtype">
                        <option value="${profile.jobtype}">${profile.jobtype}</option> 
                        <option value="">Change Jobtype</option> 
                        <option value="Full Time">Full Time</option> 
                        <option value="Part Time">Part Time</option>
                    </select>
                </div>
                
            </div>
            <h5 style="background-color: #00000008" class="text-center mt-4">Emergency Contact Information</h5>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Next of Kin's FirstName</label>
                    <input class="form-control" type="text" name="nkfirstname" value="${profile.nkfirstname}">
                </div>
                <div class="form-group col-md-6">
                    <label>Next of Kin's Lastname</label>
                    <input class="form-control" type="text" name="nklastname" value="${profile.nklastname}">
                </div> 
            </div>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label>Relationship with Next of Kin</label>
                    <input class="form-control" type="text" name="rel" value="${profile.rel}">
                </div>
                 <div class="form-group col-md-4">
                    <label>Next of Kin's Phone Number</label>
                    <input class="form-control" type="text" name="npnumber" value="${profile.npnumber}">
                </div>
                 <div class="form-group col-md-4">
                    <label>Alternative Phone Number</label>
                    <input class="form-control" type="text" name="npnumber2" value="${profile.npnumber2}">
                </div>
            </div>
            <div class="form-row"> 
                <div class="form-group col-md-12">
                    <label for="inputAddress2">Next of Kin's Address</label>
                    <textarea type="text" class="form-control md-textarea" placeholder="Address" name="nkaddress" value="">${profile.nkaddress}</textarea>      
                </div>
            </div> 
            </c:forEach>
        </div>
        <div class="modal-body">
            <button class="btn btn-primary" id="editprofile" type="submit">Edit</button>
        </div>
    </form>
</div>