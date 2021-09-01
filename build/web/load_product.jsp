<%@page import="com.sks.entities.Products"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sks.helper.ConnectionProvider"%>
<%@page import="com.sks.dao.ProductDao"%>
                      <div class="row">
    <%
        ProductDao prod=new ProductDao(ConnectionProvider.getConnection());
        ArrayList<Products> prlist=null;
        int cid=Integer.parseInt(request.getParameter("cid"));
        System.out.println(cid);
        if(cid == 0){
         prlist=prod.getAllProducts();
        }
        else{
            prlist=prod.getAllProductsByCatId(cid);
        }
        for(Products prd: prlist)
        {
    %>
    <div class="col-lg-4 col-md-6 col-sm-12">
        <div class="card mb-3" onMouseOver="this.style.background='#e6e6e6'" onMouseOut="this.style.background='#FFF'" >
            <img class="card-img-top" src="product_pics/<%=prd.getpPhoto()%>" alt="Card image cap" style="height: 22rem" >
  <div class="card-body">
      <h3 class="card-title"> <%= prd.getpTitle()%></h3>
      <b class="card-text" style="display: inline-block; font-size: 20px">Rs. <%=prd.getPdiscountedPrice()%></b> <p style="display: inline-block; font-size: 17px;color: #D5A249"><s style="color: #666666">  Rs. <%=prd.getpPrice()%></s>(<%=prd.getpDiscount()%>% off)</p>
  </div>
  <div class="card-footer">
      <button class="btn btn-dark " onclick="add_to_cart(<%=prd.getPid()%>,'<%=prd.getpTitle()%>',<%= prd.getPdiscountedPrice()%>)">Add to Cart</button>
  </div>
</div>
    </div>
  <%
  }
  %>
</div>