<%@page import="java.util.ArrayList"%>
<%@page import="com.sks.entities.Category"%>
<%@page import="com.sks.dao.ProductDao"%>
<%@page import="com.sks.helper.ConnectionProvider"%>
<nav class="navbar navbar-expand-lg navbar-dark " style="background-image:url('img/login-background.jpg');background-size: cover;">
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
            <span class="fa fa-check-square"></span> Categories
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
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"><span class="fa fa-address-card"></span> Contact</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="register_page.jsp"><span class="fa fa-user-plus"></span> Sign Up</a>
      </li>
      
     <li class="nav-item">
          <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart" style="color: #fff" ><i class="fa fa-cart-plus "></i><span class="cart-items"><b> (0)</b></span></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>