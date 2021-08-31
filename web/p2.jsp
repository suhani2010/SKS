<%@page import="com.sks.entities.User"%>

<%@page errorPage="error_page.jsp" %>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null)
{
    response.sendRedirect("login_page.jsp");
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Profile Page</title>
</head>
    <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,600,700&display=swap');
         img{
     display: block;
     max-width: 100%;
     height: auto;
 }
 	



   
    </style>
<body>
    <%--navbar--%>
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-image:url('img/login-background.jpg');background-size: cover;">
<a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>SKS</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav mr-auto">
  <li class="nav-item active">
    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
  </li>

  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="fa fa-check-square-o"></span> Categories
    </a>
    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
      <a class="dropdown-item" href="#">Hi</a>
          <a class="dropdown-item" href="#">Helloo</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Heyy</a>
    </div>
  </li>
  <li class="nav-item">
      <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact</a>
  </li>


</ul>
  <ul class="navbar-nav mr-right">
    <li class="nav-item">
      <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%=user.getName()%></a>
    </li>  
    <li class="nav-item">
      <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-circle"></span> Logout</a>
    </li>  

  </ul>


</div>
</nav>
    <%--end of navbar--%>
        <!--banner-->
   <div class="container-fluid p-0 m-0" >
       <div class="slide-banner-class " data-src style="display: block"><img src="img/banner2.jpg">
       </div>
   </div>
       <!--end of banner-->
    <%--profile modal--%>
    <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
    <div class="modal-header  text-white" style="background-image:url('img/login-background.jpg');background-size: cover;">
    <h5 class="modal-title" id="exampleModalLabel">SKS</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body">
      <div class="container text-center">
          <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px">
          <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
          <%--details--%>
          <div id="profile-details">
          <table class="table">

            <tbody>
                <tr>
                    <th scope="row">ID: </th>
                    <td><%=user.getId()%></td>

                </tr>
                      <tr>
                        <th scope="row">Email: </th>
                        <td><%=user.getEmail()%></td>

                      </tr>
                      <tr>
                        <th scope="row">Gender: </th>
                        <td><%=user.getGender()%></td>

                      </tr>
                      <tr>
                        <th scope="row">Status: </th>
                        <td><%=user.getAbout()%></td>

                      </tr>
                      <tr>
                        <th scope="row">Registered on: </th>
                        <td><%=user.getDateTime().toString()%></td>

                      </tr>
            </tbody>
        </table>
          </div>
          <!--profile-edit-->
          <div id="profile-edit" style="display: none;">
              <h3 class="mt-2">Edit Your Details</h3>
              <form action="EditServlet" id="profileEdit-form" method="post" enctype="multipart/form-data">
                  <table class="table">

            <tbody>
                <tr>
                    <th scope="row">ID: </th>
                    <td><%=user.getId()%></td>

                </tr>
                      <tr>
                        <th scope="row">Email: </th>
                        <td><input type="email" class="form-control" name="user_email" value="<%=user.getEmail()%>" ></td>

                      </tr>
                      <tr>
                        <th scope="row">Username: </th>
                        <td><input type="text" class="form-control" name="user_name" value="<%=user.getName()%>" ></td>
                      </tr>
                      <tr>
                        <th scope="row">Password: </th>
                        <td style="position: relative;"><input type="password" id="PasswordField" class="form-control" name="user_password" value="<%=user.getPassword()%>" ><i class="fa fa-eye-slash" id="eye" aria-hidden="true" style="position: absolute; right: 17px; margin-top: -27px;"></i></td>
                      </tr>
                      <tr>
                        <th scope="row">Gender: </th>
                        <td><%=user.getGender().toUpperCase()%></td>

                      </tr>
                      <tr>
                        <th scope="row">Status: </th>
                        <td><textarea rows="3" class="form-control" name="user_about"><%=user.getAbout()%></textarea>

                      </tr>
                      <tr>
                        <th scope="row">Profile Photo: </th>
                        <td><input type="file" class="form-control" name="image" value="img/error.png"  ></td>
                        
                      </tr>
                      <tr>
                        <th scope="row">Registered on: </th>
                        <td><%=user.getDateTime().toString()%></td>

                      </tr>
            </tbody>
        </table>
                        <button type="submit" class="btn btn-outline-dark">Save Details</button>
              </form>

    </div>
    <!--end of profile edit-->
      </div>
  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    <button type="button" id="edit-profile-button" class="btn btn-dark  ">Edit</button>
  </div>
</div>
</div>
</div>
    <%--end of profile modal--%>


<!--javascripts-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/myjs.js" type="text/javascript"></script>

<script>
    $(document).ready(function(){
        let editStatus=false;
        $('#edit-profile-button').click(function(){
            //alert("hello");
            if(editStatus == false){
            $('#profile-details').hide();
            $('#profile-edit').show();
            editStatus=true;
            $(this).text("Done");
        }
        else{
            $('#profile-details').show();
            $('#profile-edit').hide();
            editStatus=false;
            $(this).text("Edit ");
        }
        });
        $('#eye').click(function(){
                   if(document.getElementById("PasswordField").type=="password"){
                       document.getElementById("PasswordField").type="text";
                       this.classList.add("fa-eye");
                       this.classList.remove("fa-eye-slash");
                   }
                   else{
                       document.getElementById("PasswordField").type="password";
                       this.classList.remove("fa-eye");
                       this.classList.add("fa-eye-slash");
                   }
                });
                
                
                
                
   $('#profileEdit-form').on('submit',function(event){
    event.preventDefault();
    let form=new FormData(this);
    
    //sending data to edit servlet through ajax
    $.ajax({
        url:"EditServlet",
        type:'post',
        data:form,
        
        success: function (data) {
            
           if(data.trim()=="Updated"){
                swal({
                     title: "Profile Updated Succesfully!",
                     text: "🤩🤩",
                     icon: "success",
                    
                 }).then((value) => {
                     window.location="profile.jsp"
                 });
            }
            else{
                swal("Something went wrong try again!!");
                
            }
       // console.log(data);
        },
        
        error: function (e){
            swal("Something went wrong try again!!");
        },
        processData: false,
        contentType:false
        
    });

    });
    
    });
    
    
</script>



</body>
</html>
