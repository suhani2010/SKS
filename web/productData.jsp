<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Data</title>
         <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    </head>
    <body >
<!--
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.sks.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
 Modal 
<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg"  role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Users</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">-->
        <%
           Connection con=ConnectionProvider.getConnection();
           try{
           Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM product");
            %>
            <div class="container">
            <table class="table table-bordered m-5" style="border: 1px ">
                <thead class="thead-light">
                    <tr>
                        <th>pid</th>
                        <th>pTitle</th>
                        <th>pDesc</th>
                        <th>pPhoto</th>
                        <th>pPrice</th>
                        <th>pDiscount</th>
                        <th>pQuantity</th>
                        <th>pDate</th>
                        <th>catId</th>
                    </tr>
                </thead>    
          <%
            while(rs.next())
            {
                %><tr>
                <td><%out.print(rs.getString(1)+"\t");%></td>
                <td><%out.print(rs.getString(2)+"\t");%></td>
                <td><%out.print(rs.getString(3)+"\t");%></td>
                <td><%out.print(rs.getString(4)+"\t");%></td>
                <td><%out.print(rs.getString(5)+"\t");%></td>
                <td><%out.print(rs.getString(6)+"\t");%></td>
                <td><%out.print(rs.getString(7)+"\t");%></td>
                <td><%out.print(rs.getString(8)+"\t");%></td>
                <td><%out.print(rs.getString(9));%></td></tr><%
                
            }%>
            </table></div><%
           }
           catch(Exception e)
           {
               e.printStackTrace();
           }
        
        %>
</body>
        </html>
<!--      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        
      </div>
    </div>
  </div>
</div>-->