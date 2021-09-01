<%@page import="com.sks.entities.Products"%>
<%@page import="com.sks.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sks.helper.ConnectionProvider"%>
<%@page import="com.sks.dao.ProductDao"%>
<%@page import="com.sks.entities.Message"%>
<%@page import="com.sks.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null)
{
    Message m=new Message("You are not logged in!! Please login to access Checkout Page","error","alert-danger");
        session.setAttribute("msg", m);
    response.sendRedirect("login_page.jsp");
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Checkout Page</title>
</head>
    <!--css-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	

<body  style="background: #F6ECEC">
    <%--navbar--%>
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-image:url('img/login-background.jpg');background-size: cover;">
<a class="navbar-brand" href="profile.jsp"><span class="fa fa-asterisk"></span>SKS</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>

<div class="collapse navbar-collapse" id="navbarSupportedContent">
<ul class="navbar-nav mr-auto">
  <li class="nav-item active">
    <a class="nav-link" href="profile.jsp">Home <span class="sr-only">(current)</span></a>
  </li>

<!--  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="fa fa-check-square-o"></span> Categories
    </a>
    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
      <%
              ProductDao p=new ProductDao(ConnectionProvider.getConnection());
              ArrayList<Category> list2=p.getAllCategories();
              for(Category cc:list2)
              {
          %>
          <a class="dropdown-item" onclick="getProducts(<%=cc.getCid()%>)" href="#"><%=cc.getName()%></a>
          <%
              }
          %>
    </div>
  </li>-->
  <li class="nav-item">
      <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact</a>
  </li>


</ul>
    
  <ul class="navbar-nav mr-right">
           <li class="nav-item">
          <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart" style="color: #fff" ><i class="fa fa-cart-plus "></i><span class="cart-items"><b> (0)</b></span></a>
      </li>
    <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal" style="color: #fff"><span class="fa fa-user-circle"></span><%=user.getName()%></a>
    </li>  
    <li class="nav-item">
      <a class="nav-link" href="LogoutServlet" style="color: #fff"><span class="fa fa-user-circle"></span> Logout</a>
    </li>  

  </ul>


</div>
</nav>
    <%--end of navbar--%>
   
      
       <div class="container">
        
            <div class="text-center mt-5">
                <!--cart table-->
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Your Selected Item</h3>
                    </div>
                    <div class="card-body" >
                <div class="cart-body"></div>
                <div style="font-size: 1.2rem"><b >Payment Mode:</b> Cash On Delivery <span style="color: #6C757D; font-size: 0.75rem">(Delivery Charges may apply)</span></div>
                    <form action="ShippingDetailsServlet" method="post" id="shipping-form">
                                    <div class="form-group">
                                        <h3 class="text-left">Id</h3>
                                        <input type="text" name="user_id" required class="form-control" value="<%=user.getId()%>">
                                    </div>
                                    <div class="form-group">
                                        <h3 class="text-left">username</h3>
                                        <input type="text" name="user_name" required class="form-control" value="<%=user.getName()%>" >
                                    </div>
                                    <div class="form-group">
                                        <h3 class="text-left">Contact</h3>
                                        <input type="number" name="user_contact" required class="form-control" placeholder="Enter Contact Number">
                                    </div>
                                    <div class="form-group" style="position: relative;">
                                        <h3 class="text-left">Address</h3>
                                        <input type="text" name="user_address" required class="form-control"  placeholder="Enter your address">
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" onclick="orderplacedCart()" class="btn btn-success btn-lg mt-4 " id="place_order">Place Order</button>
                                    </div>
                                </form>
                    </div>
                    
<!--                        <form action="ShippingDetailsServlet" id="profileEdit-form" method="post" enctype="multipart/form-data">
                  <table class="table">

            <tbody>
              
                    
                      
                      <tr>
                        <th scope="row">Contact number<span style="color:#FF0800; font-size: 20px">*</span></th>
                        <td ><input type="number" class="form-control" name="user_" placeholder="Enter your mobile number" ></td>

                      </tr>
                      <tr>
                        <th scope="row">Address<span style="color:#FF0800; font-size: 20px">*</span> </th>
                        <td><textarea rows="3" class="form-control" name="user_address" placeholder="Enter your address"></textarea>

                      </tr>
                      
                    
            </tbody>
        </table>
                            <div class=" card-footer text-center">
                                 <button type="submit" class="btn btn-lg" style="background: #60b246;color: #ffffff" >Place Order</button>
     
                    </div>
                                          </form>-->

            </div>
        </div>
       </div>
    <%--profile modal--%>

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
                        <th scope="row">User Type: </th>
                        <td><%=user.getType()%></td>

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
                        <th scope="row">User Type: </th>
                        <td><%=user.getType()%></td>

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
    <%--end of profile modal--%>


<!--javascripts-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script>
    $(document).ready(function(){
     $('#shipping-form').on('submit',function(event){
         
    event.preventDefault();
    let form=new FormData(this);
    
    //sending data to edit servlet through ajax
//    $.ajax({
//        url:"ShippingDetailsServlet",
//        type:'post',
//        data:form,
//        
//        success: function (data) {
//            
//           if(data.trim()=="Order"){
//               
//                swal({
//                     title: "order placed Succesfully!",
//                     text: "🤩🤩",
//                     icon: "success",
//                    
//                 }).then((value) => {
//                     window.location="profile.jsp"
//                 });
//            }
//            else{
//                swal("Something went wrong!!");
//                
//            }
//       // console.log(data);
//        },
//        
//        error: function (e){
//            swal("Something went wrong try again!!");
//        },
//        processData: false,
//        contentType:false
//        
//    });
//
//    });
//    });
//    
//    </script>
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
                swal("Something went wrong!!");
                
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


<%@include file="cartModal.jsp" %>
</body>
</html>


