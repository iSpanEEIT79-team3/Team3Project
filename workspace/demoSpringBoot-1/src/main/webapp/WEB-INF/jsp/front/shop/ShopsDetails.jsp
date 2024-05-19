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
	
	    <link rel="stylesheet" href="../front/shop/shopcss/bootstrap.min.css" type="text/css">
	    <link rel="stylesheet" href="../front/shop/shopcss/font-awesome.min.css" type="text/css">
	    <link rel="stylesheet" href="../front/shop/shopcss/elegant-icons.css" type="text/css">
	    <link rel="stylesheet" href="../front/shop/shopcss/jquery-ui.min.css" type="text/css">
	    <link rel="stylesheet" href="../front/shop/shopcss/magnific-popup.css" type="text/css">
	    <link rel="stylesheet" href="../front/shop/shopcss/owl.carousel.min.css" type="text/css">
	    <link rel="stylesheet" href="../front/shop/shopcss/slicknav.min.css" type="text/css">
	    <link rel="stylesheet" href="../front/shop/shopcss/style.css" type="text/css">
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
    <p>這裡是shopDetails.jsp</p>

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__left product__thumb nice-scroll">
                        	<c:forEach items="${shops}" var="shop">
	                        	<a class="pt active" href="#product-1">
		                            <img src="../${shop.productImg}"  alt="">
		                    	</a>
	                       	</c:forEach>
                        		
                     		<c:forEach items="${shopImgs}" var="shopImgs" varStatus="s">
	                            <a class="pt" href="#product-${s.count+1}">
	                               <img src="../${shopImgs.productImages}"  alt="">
	                            </a>
	                              <c:set var="count" value="${s.count}" />
                     		</c:forEach>
                        </div>
                        <div class="product__details__slider__content">
                            <div class="product__details__pic__slider owl-carousel">
                            <c:forEach items="${shops}" var="shop">
                            	<img data-hash="product-1" class="product__big__img" src="../${shop.productImg}" alt="">
		                    </c:forEach>
		                    <c:forEach items="${shopImgs}" var="shopImgs" varStatus="s">
		                    <img data-hash="product-${s.count+1}" class="product__big__img" src="../${shopImgs.productImages}" alt="">
	                              <c:set var="count" value="${s.count}" />
                     		</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <c:forEach items="${shops}" var="shop">
                <div class="col-lg-6">
                    <div class="product__details__text">
                        <h3>${shop.productName}</h3>

                        <div class="product__details__price">NT$${shop.productPrice}</div>
                        <p>${shop.productIntroduce}</p>
                        <div class="product__details__button">
                            <div class="quantity">
                                <span>數量</span>
                                <div class="pro-qty">
                                	<span class="dec qtybtn">-</span>
                                    <input type="text" id="quantity-input" value="1" min="1">
                                	<span class="inc qtybtn">+</span>
                                </div>
                            </div>
                            <a href="#" class="cart-btn"><span class="icon_bag_alt"></span>加入購物車</a>
                            <ul>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_adjust-horiz"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__details__widget">
                            <ul>
                                <li>
                                    <span>尺寸</span>
                                    <div class="size__btn">
                                        <label for="xs-btn" class="active">
                                            <input type="radio" id="xs-btn" name="size" value="xs" checked>
                                            xs
                                        </label>
                                        <label for="s-btn">
                                            <input type="radio" id="s-btn" name="size" value="s">
                                            s                               
                                        </label>                            
                                        <label for="m-btn">                 
                                            <input type="radio" id="m-btn" name="size" value="m">
                                            m                               
                                        </label>                            
                                        <label for="l-btn">                 
                                            <input type="radio" id="l-btn" name="size" value="l">
                                            l
                                        </label>
                                        <label for="xl-btn">
                                            <input type="radio" id="xl-btn" name="size" value="xl">
                                            xl
                                        </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
			<br>
			<br>
			<br>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="related__title">
                        <h3>你可能會喜歡的商品</h3>
                    </div>
                    <a href="/Shopproduct/getShopcart" class="btn btn-primary">前往購物車</a>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../images/dog1.jpg">
                            <ul class="product__hover">
                                <li><a href="../images/dog1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Buttons tweed blazer</a></h6>
                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../images/cat1.jpg">
                            <ul class="product__hover">
                                <li><a href="../images/cat1.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Flowy striped skirt</a></h6>

                            <div class="product__price">$ 49.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../images/cat2.jpg">
                            <ul class="product__hover">
                                <li><a href="../images/cat2.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Cotton T-Shirt</a></h6>

                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="../images/cat3.jpg">
                            <ul class="product__hover">
                                <li><a href="../images/cat3.jpg" class="image-popup"><span class="arrow_expand"></span></a></li>
                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">Slim striped pocket shirt</a></h6>

                            <div class="product__price">$ 59.0</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->

    </div>
    
    <script>
    var shopData = [
        <c:forEach items="${shops}" var="shop" varStatus="status">
            {
            	productId : "${shop.productId}",
                productName: "${shop.productName}",
                productImg: "${shop.productImg}",
                productPrice: "${shop.productPrice}"
                // 其他商品資料
            }<c:if test="${not status.last}">,</c:if>
        </c:forEach>
    ];
    // 監聽加入購物車按鈕的點擊事件
    document.querySelector('.cart-btn').addEventListener('click', function(event) {
        // 阻止表單默認提交行為
        event.preventDefault();
        var productId = shopData[0].productId;
        var productName = shopData[0].productName;
        var productImg = shopData[0].productImg;
        var productPrice = shopData[0].productPrice;
        var Size = document.querySelector('.size__btn input[type="radio"]:checked').value;
        var quantity = document.getElementById('quantity-input').value;
    	
		console.log("商品ID:"+productId);
		console.log("名稱:"+productName);
    	console.log("圖片路徑:"+productImg);
    	console.log("價格:"+productPrice);
    	console.log("尺寸:"+Size);
    	console.log("數量:"+quantity);
        $.ajax({
            type: 'POST',
            url: 'addShopcart', //Servlet路徑
            data: {
            	productId: productId,
                productName: productName,
                productImg: productImg,
                productPrice: productPrice,
                Size : Size,
                quantity: quantity
            },
            success: function (response) {
                alert('商品以新增至購物車');
            },
            error: function () {
                alert('加入購物車失敗');
            }
        });
    
    });
</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	        integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous">
	        </script>
    <script>
      
//         fetch('../html/basic.html')
//             .then(response => response.text())
//             .then(html => {
//                 document.body.innerHTML += html;
//             });
			fetch('../html/basic.html')
			    .then(response => response.text())
			    .then(html => {
			        document.body.insertAdjacentHTML('beforeend', html);
			    });
		     // 监听减少数量按钮的点击事件
	        var decreaseButtons = document.querySelectorAll('.dec');
	        decreaseButtons.forEach(function (button) {
	            button.addEventListener('click', function () {
	                var input = this.nextElementSibling;
	                var quantity = parseInt(input.value);
	                if (quantity > 1) { // 确保数量不会小于1
	                    input.value = quantity - 1;
	                }
	            });
	        });

	        // 监听增加数量按钮的点击事件
	        var increaseButtons = document.querySelectorAll('.inc');
	        increaseButtons.forEach(function (button) {
	            button.addEventListener('click', function () {
	                var input = this.previousElementSibling;
	                input.value = parseInt(input.value) + 1;
	            });
	        });
        
    </script>

        <script src="../front/shop/shopjs/jquery-3.3.1.min.js"></script>
        <script src="../front/shop/shopjs/bootstrap.min.js"></script>
        <script src="../front/shop/shopjs/jquery.magnific-popup.min.js"></script>
        <script src="../front/shop/shopjs/jquery-ui.min.js"></script>
        <script src="../front/shop/shopjs/mixitup.min.js"></script>
        <script src="../front/shop/shopjs/jquery.countdown.min.js"></script>
        <script src="../front/shop/shopjs/jquery.slicknav.js"></script>
        <script src="../front/shop/shopjs/owl.carousel.min.js"></script>
        <script src="../front/shop/shopjs/jquery.nicescroll.min.js"></script>
        <script src="../front/shop/shopjs/main.js"></script>
        
        
</body>


</html>