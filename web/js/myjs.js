function add_to_cart(pid,pname,pprice){
    let cart=localStorage.getItem("cart");
    
    if(cart==null)
    {
        //cart is empty
        let products=[];
        let product={productId:pid,productName:pname,productQuantity:1,productPrice:pprice};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        console.log("product is added for the first time");
         myFunction("product is added for the first time");
    }
    else
    {
        //cart is already present
        let pCart=JSON.parse(cart);
        let oldProduct=pCart.find((item)=>item.productId == pid);
        
        if(oldProduct){
            //we have to increase the quantity
            oldProduct.productQuantity=oldProduct.productQuantity+1;
            pCart.map((item)=>{
                if(item.productId == oldProduct.productId){
                item.productQuantity=oldProduct.productQuantity;
            }
            })
            localStorage.setItem("cart",JSON.stringify(pCart));
            console.log("product quantity is increased");
            myFunction("product quantity is increased")
        }
        else{
            //we have to add product
            let product={productId:pid,productName:pname,productQuantity:1,productPrice:pprice};
            pCart.push(product);
            localStorage.setItem("cart",JSON.stringify(pCart));
            console.log("product is added");
            myFunction("product is added")
        }
    }
    updateCart();
}

function updateCart(){
    let cartString=localStorage.getItem("cart");
    let cart=JSON.parse(cartString);
    if(cart==null || cart.length==0)
    {
        console.log("Cart is empty!!");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h4>Cart Empty</h4>");
        $(".checkout-btn").attr('disabled',true);
        
    }
    else
    {
        //there is something in cart to show
        $(".cart-items").html(`(${cart.length})`);
        let table=`<table class='table'>
        <thead class='thead-light'>
        <tr class="text-center">
        <th>Item Name</th>
        <th>Item Price</th>
        <th>Item Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        
        </tr>

</thead>

`;
        let totalPrice=0;
        
     cart.map((item)=>{
         table+=`<tr class="text-center">
         <td>${item.productName}</td>
         <td>${item.productPrice}</td>
         <td>${item.productQuantity}</td>
         <td>${item.productQuantity*item.productPrice}</td>
         <td class="text-center"><i onclick='deleteItemFromCart(${item.productId})' class="fas fa-trash-alt" style="color: #cc0000; cursor:pointer"></i></td>


</tr>`;
            totalPrice+=item.productPrice*item.productQuantity;
     })   
table=table+`<tr><td colspan='5' class='text-center font-weight-bold ' >Subtotal : Rs. ${totalPrice}</td></tr></table>`

 $(".cart-body").html(table);
 $(".checkout-btn").attr('disabled',false);
    }
}
//delete item
function deleteItemFromCart(pid){
    let cart=JSON.parse(localStorage.getItem('cart'));
    let newCart=cart.filter((item)=>item.productId!=pid)
    localStorage.setItem('cart',JSON.stringify(newCart));
     myFunction("product is removed")
    updateCart();
    
}
function orderplacedCart(){
    localStorage.clear();
}
$(document).ready(function(){
    updateCart();
})

function myFunction(content) {
  $('#snackbar').addClass('show');
  $('#snackbar').html(content);
    setTimeout(()=>{$('#snackbar').removeClass('show');
},3000)
}
function goToCheckout(){
    window.location='checkout.jsp'
}

