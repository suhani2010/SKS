
<%@page import="com.sks.helper.Helper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sks.entities.Category"%>
<%@page import="com.sks.helper.ConnectionProvider"%>
<%@page import="com.sks.dao.ProductDao"%>
<%@page import="com.sks.entities.Message"%>
<%@page import="com.sks.entities.User"%>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
        Message m=new Message("You are not logged in!!","error","alert-danger");
        session.setAttribute("msg", m);
        response.sendRedirect("login_page.jsp");
        return;
    }
    else{
        if(user.getType().equals("normal"))
        {
            Message m=new Message("You are not an admin","error","alert-danger");
            session.setAttribute("msg", m);
            response.sendRedirect("login_page.jsp");
            return;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
         <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
          <style>
              .card :hover{
                  background-color: #333333;
              }
              .card :hover .btn{
                  background-color: #5BC0DE;
              }
          </style>

    </head>
    <body>
        
         <!--navbar-->   
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
      <%
              ProductDao p=new ProductDao(ConnectionProvider.getConnection());
              ArrayList<Category> list2=p.getAllCategories();
              for(Category cc:list2)
              {
          %>
          <a class="dropdown-item" href="#"><%=cc.getName()%></a>
          <%
              }
          %>
    </div>
  </li>
  <li class="nav-item">
      <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact</a>
  </li>


</ul>
  <ul class="navbar-nav mr-right">
    <li class="nav-item">
      <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" style="color: #fff"><span class="fa fa-user-circle" ></span><%=user.getName()%></a>
    </li>  
    <li class="nav-item">
      <a class="nav-link" href="LogoutServlet" style="color: #fff"><span class="fa fa-user-circle"></span> Logout</a>
    </li>  

  </ul>


</div>
</nav>
    <%--end of navbar--%>
    
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
    <div class="text-center mt-5">
        <h2>Welcome to the Admin Panel <%=user.getName()%> </h2></div>
    <!--user modal-->
    <%--<%@include file="userModal.jsp" %>--%>
     <!--cards-->
   <div class="container mt-5">
       
       <div class="row mb-3 p-2">
            <div class="col-md-4">
                <div class="card" style="background-color: #68AE00; color: #ffffff">

                    <div class="card-body text-center">
                        <h2 class="card-title"><%=Helper.getUserCount()%></h2>
                      <h2 class="card-title">Users</h2>
                      <img src="img/feedback.png" class="img-fluid mb-2" alt="product icon" style="max-width: 150px">
                      <a href="userModal.jsp" class="btn btn-dark btn-lg text-white" style="display: block">View</a>
                    </div>
                </div>
            </div>
          
           <div class="col-md-4">
                <div class="card" style="background-color: #FC8213; color: #ffffff">

                    <div class="card-body text-center">
                        <h2 class="card-title"><%=list2.size()%></h2>
                        <h2 class="card-title" >Categories</h2>
                         <img src="img/to-do-list.png" class="img-fluid mb-2" alt="product icon" style="max-width: 150px">
                         <a href="catData.jsp" class="btn btn-dark btn-lg text-white" style="display: block">View</a>
                    </div>
                </div>
            </div>
           <div class="col-md-4">
                <div class="card" style="background-color: #5BC0DE; color: #ffffff">

                    <div class="card-body text-center">
                        <h2 class="card-title"><%=Helper.getProductCount()%></h2>
                        <h2 class="card-title" >Products</h2>
                        <img src="img/product.png" class="img-fluid mb-2" alt="product icon" style="max-width: 150px">
                        <a href="productData.jsp" class="btn btn-dark btn-lg text-white" style="display: block">View</a>
                    </div>
                </div>
            </div>
 
        </div>
   <div class="row p-2">
            <div class="col-md-6">
                <div class="card" style="background-color: #337AB7; color: #ffffff">

                    <div class="card-body text-center">
                      <h2 class="card-title">Add Category</h2>
                     <img src="img/stories.png" class="img-fluid mt-2 mb-2" alt="product icon" style="max-width: 150px">
                      <a href="#" class="btn btn-dark btn-lg text-white" data-toggle="modal" data-target="#categoryModal" style="display: block">Add</a>
                    </div>
                </div>
            </div>
       
            <div class="col-md-6">
                <div class="card" style="background-color: #333333; color: #ffffff">

                    <div class="card-body text-center">
                      <h2 class="card-title">Add Product</h2>
                      <img src="img/add-to-cart.png" class="img-fluid  mt-2 mb-2" alt="product icon" style=" max-width: 150px">
                      <a href="#" class="btn btn-dark btn-lg text-white"style="display: block; background-color: #5BC0DE" data-toggle="modal" data-target="#productModal">Add</a>
                    </div>
                </div>
            </div>
 
        </div>
       
   </div>
   
    <!--end of cards-->
    
    
    <!--category modal-->

<!-- Modal -->
<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header  text-white" style="background-image:url('img/login-background.jpg');background-size: cover;">
        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <form action="AddCatServlet" id="catResponse"  method="post" >
                  <table class="table">

            <tbody>
                      <tr>
                        <th scope="row">Category Title: </th>
                        <td><input type="text" id="catTitle" class="form-control" name="catTitle" placeholder="Enter Category Title"   /></td>
                        <h4 id="error-title"></h4>
                      </tr>
                      <tr>
                        <th scope="row">Category Description: </th>
                        <td><textarea placeholder="Enter Category Description" class="form-control" name="catDescription"  style="height: 200px" ></textarea></td>
                      </tr>
            </tbody>
        </table>
             <button type="button" id="catclose" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" id="catSubmit" class="btn btn-outline-dark">Add Category</button>
         </form>
      </div>
      
    </div>
  </div>
</div>
</div>
    
    
    <!--end of category model-->
    <!--Product Modal-->>

<div class="modal fade" id="productModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-white" style="background-image:url('img/login-background.jpg');background-size: cover;">
        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
            <form action="AddProductServlet" id="add-product-form" method="post" enctype="multipart/form-data">
                <table class="table">

					<tbody>
                                                <tr>
						   <th scope="row"><span style="color:#FF0800; font-size: 18px">*</span>Select Category: </th>
                                                   <td><select class="form-control" name="cid" style="cursor:pointer" required>
                                                           <option value="" selected disabled>--Select Category--</option>  
                                                           <%
                                                               ProductDao pd=new ProductDao(ConnectionProvider.getConnection());
                                                               ArrayList<Category> list=pd.getAllCategories();
                                                               for(Category c:list)
                                                               {
                                                           %>
                                                           <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                                                           <%
                                                               }
                                                           %>        
                                                                   
                                                       </select></td>
						</tr>
                                            
                                            
						<tr>
						   <th scope="row"><span style="color:#FF0800; font-size: 18px">*</span>Product Title: </th>
                                                   <td><input type="text" id="productTitle" class="form-control" id="pTitle" name="pTitle" placeholder="Enter Product Title" required /></td>
                                                   <h4 id="error-product"></h4>
						</tr>
						
						  
						  
						<tr>
						   <th scope="row">Product Description: </th>
						   <td><textarea placeholder="Enter Product Description" class="form-control" id="pDescription" name="pDescription"  style="height: 200px" ></textarea></td>
						</tr>
						  
						
						<tr>
						   <th scope="row"><span style="color:#FF0800; font-size: 18px">*</span>Product Price: </th>
                                                   <td><input type="number" class="form-control" id="pPrice" name="pPrice" placeholder="Enter Product Price" required /></td>
						</tr>
						 
						 
						 <tr>
						   <th scope="row"><span style="color:#FF0800; font-size: 18px">*</span>Product Discount </th>
						   <td><input type="number" class="form-control" id="pDiscount" name="pDiscount" placeholder="Enter Product Discount" required /></td>
						</tr>
						
						
						<tr>
						   <th scope="row"><span style="color:#FF0800; font-size: 18px">*</span>Product Quantity </th>
						   <td><input type="number" class="form-control" id="pQuantity" name="pQuantity" placeholder="Enter Product Quantity" required /></td>
						</tr>
                                                
						<tr>
						   <th scope="row"><span style="color:#FF0800; font-size: 18px">*</span>Product Photo: </th>
                                                   <td><input type="file" class="form-control" id="pPic" name="pPic" required /></td>
						</tr>
						
						
					</tbody>
                </table>
                <button type="submit" id="productSubmit" class="btn btn-outline-dark" >Add Product</button>
                <button type="button" id="productClose" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </form>
        </div>
      </div>
    </div>
  </div>
</div>
    <!--end of Product Modal-->
    
    
    

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
                     window.location="admin.jsp"
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

    
    //category validation
   $('#error-title').hide(); 
   var title_err=true;
$('#catTitle').keyup(function(){
    category_check();
});
$("#catclose").click(function(){
        $("#error-title").hide();
        title_err=true;
 });
function category_check(){
    var catTitle=$("#catTitle").val();
    
    //username validation
    if(catTitle.trim()==""){
        $("#error-title").show();
        $("#error-title").html("**The category title must be filled");
        $("#error-title").focus();
        $("#error-title").css('color','red');
        title_err=false;
        return false;
    }
    else{
        $("#error-title").hide();
        title_err=true;
    }
    }
    $("#catSubmit").click(function(){
        title_err=true;
        category_check();
        if(title_err)return true;
        else return false;
    });

    //addCategory form response through ajax
    
    $('#catResponse').on('submit',function(event){
    event.preventDefault();
    let form=new FormData(this);
    
    //sending data to edit servlet through ajax
    $.ajax({
        url:"AddCatServlet",
        type:'post',
        data:form,
        
        success: function (data) {
            
           if(data.trim()=="Category Added Successfully"){
                swal({
                     title: "Category Added Succesfully!",
                     text: "🤩🤩",
                     icon: "success",
                    
                 }).then((value) => {
                     window.location="admin.jsp"
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
<script>
    $(document).ready(function(){
        $('#add-product-form').on("submit",function(event){
                event.preventDefault();
    let form=new FormData(this);
    
    //sending data to edit servlet through ajax
    $.ajax({
        url:"AddProductServlet",
        type:'post',
        data:form,
        
        success: function (data) {
            
           if(data.trim()=="Product Added Successfully"){
                swal({
                     title: "Product Added Succesfully!",
                     text: "🤩🤩",
                     icon: "success",
                    
                 }).then((value) => {
                     window.location="admin.jsp"
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
        })
    });
    
</script>

    </body>
</html>
