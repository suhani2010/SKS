
<%@page import="java.util.ArrayList"%>
<%@page import="com.sks.entities.Category"%>
<%@page import="com.sks.dao.ProductDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.sks.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

        
        <style>
/*            .banner-background{
            clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 60% 100%, 28% 95%, 0 100%, 0 0);
            }*/
            /*feature section*/
#features{
  padding: 4% 15%;
  text-align: center;
  background-color: #ffffff;
  position: relative;

}
.feature-box{
  padding: 4%;
}
 #features i{
   color: #ef8172;
   margin-bottom: 1rem;
 }
 #features i:hover{
   color: #ff4c68;
 }
 #features h3{
   font-size: 1.5rem;
   font-family: "Montserrat";
   font-weight: 700;
 }
 #features p{
   color: #8f8f8f;
 }
 .slide-banner-class{
     width: 100%;
 }
 img{
     display: block;
     max-width: 100%;
     height: auto;
 }
        </style>
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background: #F6ECEC">
        
     <!--navbar-->   
   <%@include file="normal_navbar.jsp"%>
        
   <!--banner-->
   <div class="container-fluid p-0 m-0" >
       <div class="slide-banner-class " data-src style="display: block"><img src="img/girlsBanner.jpg">
          <!-- <div class="container">
<!--               <img src="img/girlsBanner.jpg" alt="banner-girls" style="background-size: cover;"/>-->
<!--              <h3 class="display-3">Welcome to ABCD</h3>
          
           <p>Education is the most important thing in the world and no child should remain uneducated. Therefore, choosing from the great educational thoughts for children, five of the best have been given below for parents to peruse.  </p>
           <p>“When you know better, you do better.”- Maya Angelou
If you want to be more powerful in life, educate yourself. It’s that simple.
“When you talk, you are only repeating something you know. But if you listen, you may learn something new.” – Dalai Lama
“Learn as much as you can while you are young, since life becomes too busy later”- Dana Stewart Scott
“The capacity to learn is a gift; the ability to learn is a skill; the willingness to learn is a choice.”- Brian Herbert</p>
           <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start!! its free</button>
           <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login </a>-->
         <!-- <img src="https://image2.jdomni.in/banner/18072021/5B/47/A9/45072C3639DEC35528F86B3608_1626628005059.png?output-format=webp" alt="Karnataka Silk and Sarees - Saree Retailers in Malad West, Mumbai" class="bannerImg img-loaded" draggable="false" title="Karnataka Silk and Sarees - Saree Retailers in Malad West, Mumbai" style="width: 100%; display: inline-block;">-->
       
       </div>
  
       
       
       
       
   </div>
     <section id="features" >
    <div class="row">
      <div class="col-lg-4 feature-box">
          <i class="fas fa-check-circle fa-4x"></i>
        <h3>Genuine Products.</h3>
        
      </div>
      <div class="col-lg-4 feature-box">
          <i class="fas fa-truck fa-4x"></i>
        <h3>Fast Delivery.</h3>
        
      </div>
      <div class="col-lg-4 feature-box">
        <i class="fas fa-money-bill fa-4x"></i>
        <h3>Best Price.</h3>
        
      </div>
    </div>
  </section>
   
                 <!--category section-->
      
          <div class="container-fluid">
              <div class="row mt-4">
                  <!--first col-->
                  <div class="col-md-3 col-sm-5 col-5">
                      <!--categories-->
                      <div class=" text-center list-group" >
                           <a href="#" onclick="getProducts(0)" class="list-group-item list-group-item-action active" style="background-image:url('img/login-background.jpg');background-size: cover; "><i class="fa fa-sliders fa-2x hamburger"></i>
                               <h2 style="display: inline-block"> Categories</h2>
  </a>
                           <%
              ProductDao pd=new ProductDao(ConnectionProvider.getConnection());
              ArrayList<Category> list1=pd.getAllCategories();
              for(Category cc:list1)
              {
          %>
          <a href="#" onclick="getProducts(<%=cc.getCid()%>)" class="list-group-item list-group-item-action title " ><%=cc.getName()%></a>
  
  <%
              }
          %>
</div>
                  </div>
                  <!--second col-->
                  <div class="col-md-9 col-sm-7 col-7">
                      
                      <!--products-->
                      <div class="container-fluid" id="products">

                      </div>
                  </div>
                  
          
   
          </div>
          </div>



      
      <!--end of category section-->
       
   
   
   
   
   
   
        
        <!--javascripts-->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="js/myjs.js" type="text/javascript"></script>
<script>
    function getProducts(catId){
       $.ajax({
        url:"load_product.jsp",
        data:{cid:catId},
        success: function (data) {
        
        $('#products').html(data)
        
        
    }
       })  
    
    }
    $(document).ready(function(){
       getProducts(0)
    })
    
</script>
<%@include file="cartModal.jsp" %>
    </body>
</html>
