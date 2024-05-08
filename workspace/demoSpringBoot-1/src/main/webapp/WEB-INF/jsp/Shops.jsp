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
/*        .product-container { */
/*             display: flex; */
/*             flex-wrap: wrap; */
/* 		    justify-content: center; /* 將所有商品置中對齊 */ */
/* 		    margin: 0 auto; /* 將整個商品容器置中 */ */
/*         } */
/*         .product { */
/*             width: 21%; */
/*             border: 1px solid #ccc; */
/*             padding: 30px; */
/*             margin-bottom: 20px; */
/*             text-align: center; */
/*         } */
        
        
/*         .container { */
/*     width: 100%; */
/*     padding-right: 15px; */
/*     padding-left: 15px; */
/*     margin-right: auto; */
/*     margin-left: auto; */
/* } */
section {
    display: block;
    unicode-bidi: isolate;
}
.row {
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: wrap;
    flex-wrap: wrap;
    margin-right: -15px;
    margin-left: -15px;
}
       
    </style>
	<!-- Bootstrap CSS -->
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
	        integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	    <script src="https://kit.fontawesome.com/4287c80df9.js" crossorigin="anonymous"></script>
	
	    <!--Google Font : Nunito-->
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@600&display=swap" rel="stylesheet">
	
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

<body>


    <div class="container-fluid" style="margin-top: 150px;">
        <h2 class="text-center">標題</h2>
    </div>
    <!-- <section> -->
    <div class="main">    
 


<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row property__gallery" id="MixItUp06FF61" style="">
        
        <c:forEach items="${shops}" var="shop">
            <div class="col-lg-3 col-md-4 col-sm-6 mix women" style="">
                <div class="product__item">
                    <div class="product__item__pic set-bg" data-setbg="${shop.productImg}" style="background-image: url(&quot;${shop.productImg}&quot;);">
                        <ul class="product__hover">
                            <li><a href="${shop.productImg}" class="image-popup"><span class="arrow_expand"></span></a></li>
                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="/Shopproduct/${shop.productId}">${shop.productName}</a></h6>
                        <div class="product__price">NT$ ${shop.productPrice}</div>
                    </div>
                </div>
            </div>
        </c:forEach>



        </div>
    </div>
</section>
<!-- Product Section End -->





<%-- 
     <div class="product-container">
        <c:forEach items="${shops}" var="shop">
            <div class="product">
            <a href="<c:url value='/Shopproduct/${shop.productId}'/>">
                <img src="${shop.productImg}" alt="${shop.productName} Image">
                <p>${shop.productName}</p>
            </a>
                <p>NT$ ${shop.productPrice}</p>
                其他商品相關資訊
            </div>
        </c:forEach>
    </div>
--%>

    </div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
	        </script>
    <script>
      
        fetch('html/basic.html')
            .then(response => response.text())
            .then(html => {
                document.body.innerHTML += html;
            });

        
    </script>

</body>

</html>