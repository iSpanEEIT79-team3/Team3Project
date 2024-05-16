<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
         .main { 
             min-height: 55vh; 

	    }  

    </style>
	<!-- Bootstrap CSS -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
	        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	    <script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>
	
	    <!--Google Font : Nunito-->
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">
	
	    <link rel="stylesheet" href="front/shop/shopcss/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="front/shop/shopcss/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="front/shop/shopcss/elegant-icons.css" type="text/css">
	    <link rel="stylesheet" href="front/shop/shopcss/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="front/shop/shopcss/magnific-popup.css" type="text/css">
	    <link rel="stylesheet" href="front/shop/shopcss/owl.carousel.min.css" type="text/css">
	    <link rel="stylesheet" href="front/shop/shopcss/slicknav.min.css" type="text/css">
	    <link rel="stylesheet" href="front/shop/shopcss/style.css" type="text/css">
	    <!-- For style(All CSS content) -->
	    <link rel="stylesheet" type="text/css" href="../styles/home.css" />
	    <link rel="stylesheet" type="text/css" href="../styles/footer.css" />
	    <link rel="stylesheet" type="text/css" href="../styles/navbar.css" />
	    <link rel="icon" href="images/favicon.ico">
	
	    <!-- JS Bundle for BS  -->
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
	        </script>
    <title>範本</title>
</head>

<body class>


    <div class="container-fluid" style="margin-top: 75px;">
    </div>
    <!-- <section> -->
    <div class="main">    
 
 
 <!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        
         <div class="row">
            <div class="col-lg-4 col-md-4">
                <div class="section-title">
                    <h4>JFSwing Shop</h4>
                </div>
            </div>
            <div class="col-lg-8 col-md-8">
                <ul class="filter__controls">
                    <li class="active mixitup-control-active" data-filter="*">All</li>
                    <li data-filter=".Jacket">Jacket</li>
                    <li data-filter=".Clothes">Clothes</li>
                    <li data-filter=".Pants">Pants</li>
                </ul>
            </div>
        </div>
        
        
        <div class="row property__gallery">
        
        <c:forEach items="${shops}" var="shop">
            <div class="col-lg-3 col-md-4 col-sm-6 mix ${shop.productType}" style="">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="${shop.productImg}" style="background-image: url(&quot;${shop.productImg}&quot;);">
                        <ul class="product__hover">
                            <li><a href="${shop.productImg}" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li><a href="/Shopproduct/${shop.productId}"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h4><a href="/Shopproduct/${shop.productId}" style="color: black;">${shop.productName}</a></h4>
                        <div class="product__price" style="color: red;">NT$ ${shop.productPrice}</div>
                    </div>
                </div>
            </div>
        </c:forEach>

        </div>
    </div>
</section>
<!-- Product Section End -->
 


    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
	        </script>
    <script>
      
			fetch('/html/basic.html')
		    .then(response => response.text())
		    .then(html => {
		        document.body.insertAdjacentHTML('beforeend', html);
		    });

        
    </script>
        <!-- Js Plugins -->
        
        <script src="front/shop/shopjs/jquery-3.3.1.min.js"></script>
        <script src="front/shop/shopjs/bootstrap.min.js"></script>
        <script src="front/shop/shopjs/jquery.magnific-popup.min.js"></script>
        <script src="front/shop/shopjs/jquery-ui.min.js"></script>
        <script src="front/shop/shopjs/mixitup.min.js"></script>
        <script src="front/shop/shopjs/jquery.countdown.min.js"></script>
        <script src="front/shop/shopjs/jquery.slicknav.js"></script>
        <script src="front/shop/shopjs/owl.carousel.min.js"></script>
        <script src="front/shop/shopjs/jquery.nicescroll.min.js"></script>
        <script src="front/shop/shopjs/main.js"></script>
        
</body>

</html>