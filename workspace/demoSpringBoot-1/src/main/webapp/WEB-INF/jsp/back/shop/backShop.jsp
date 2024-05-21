<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>

<head>
    <meta name="description"
        content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>JFSwing後台</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="../html/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
        href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .showImg{
            display: none; /* 初始状态下隐藏图片 */
            position: absolute;
            z-index: 100;
            border:2px solid black;
        }

        #hoverImage {
            width: 300px; /* 调整图片大小 */
            height: auto;
        }
        th{
        	text-align:center;
        }
    </style>
</head>

<body class="app sidebar-mini rtl pace-done">
    <main class="app-content">
        <div class="app-title">
            <h1>JF Swing 商城後臺管理</h1>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="tile">
                    <div class="tile-title">
                        <h2>小標題</h2>
                    </div>
                    <div class="tile-body">
<!-- row start -->
						<div class="row">
					        <div class="col-md-12">
					          <div class="tile">
					            <div class="tile-body">
					              <table class="table table-hover table-bordered" id="sampleTable">
					                <thead>
					                  <tr>
					                    <th>商品ID</th>
					                    <th>照片</th>
					                    <th>商品名稱</th>
					                    <th>商品材質</th>
					                    <th>價格</th>
					                    <th>分類</th>
					                    <th>XSsize</th>
					                    <th>Ssize</th>
					                    <th>Msize</th>
					                    <th>Lsize</th>
					                    <th>XLsize</th>
					                    <th>修改</th>
					                    <th>刪除</th>
					                  </tr>
					                </thead>
					                <tbody>
									<!--內容-->
									<c:forEach items="${shops}" var="shop" varStatus="s">
					                  <tr data-no="${shop.productId}">
						                    <td><a href="/openshopid/${shop.productId}">${shop.productId}</a></td>
						                    <td style="max-width:80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
											<button id="hoverButton_${shop.productId}" class="btn btn-secondary">顯示圖片</button>
										    <div class="showImg" id="imageContainer_${shop.productId}">
										        <img id="hoverImage" src="${shop.productImg}" alt="Hover Image">
										    </div>
											</td>
						                    <td title="${shop.productName}" style="max-width:100px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${shop.productName}</td>
						                    <td title="${shop.productIntroduce}" style="max-width:400px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${shop.productIntroduce}</td>
						                    <td style="width:50px;">${shop.productPrice}</td>
						                    <td style="width:75px;">${shop.productType}</td>
					                    
					                    <c:forEach items="${shopQuan}" var="shopQuan" varStatus="s">
                                		<c:if test="${shop.productId == shopQuan.productId}">
	                                		<td style="width:50px;">${shopQuan.xsSize}</td>
		                                    <td style="width:50px;">${shopQuan.sSize}</td>
		                                    <td style="width:50px;">${shopQuan.mSize}</td>
		                                    <td style="width:50px;">${shopQuan.lSize}</td>
		                                    <td style="width:50px;">${shopQuan.xlSize}</td>
                                		</c:if>
                                		</c:forEach>
                                		<td style="position: relative;text-align: center;"><button class="btn btn-success" onclick="editRow(${shop.productId})">修改</button></td>
                           				 <td style="position: relative;text-align: center;"><button class="btn btn-danger" onclick="deleteProduct(${shop.productId})">刪除</button></td>
					                  </tr>
					                 </c:forEach>
					                </tbody>
					              </table>
					             <div style="display: flex; justify-content: center;">
					              <button style="margin-right: 10px;" class="btn btn-primary" onclick="addProductRow()">新增商品</button>
					              <button class="btn btn-primary" onclick="autoinput()">一鍵代入</button>					                 
					            </div>
					            </div>
					          </div>
					        </div>
					      </div>
<!-- row end -->
                    </div>
                </div>
            </div>
        </div>


    </main>


    <!-- Essential javascripts for application to work-->
    <script src="../html/js/jquery-3.2.1.min.js"></script>
    <script src="../html/js/popper.min.js"></script>
    <script src="../html/js/bootstrap.min.js"></script>
    <script src="../html/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="../html/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="../html/js/plugins/chart.js"></script>
    <script type="text/javascript" src="../html/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../html/js/plugins/dataTables.bootstrap.min.js"></script>
        <!-- Essential javascripts for application to work-->
    <script src="back/shop/js/jquery-3.2.1.min.js"></script>
    <script src="back/shop/js/popper.min.js"></script>
    <script src="back/shop/js/bootstrap.min.js"></script>
    <script src="back/shop/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="back/shop/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="back/shop/js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="back/shop/js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
    <script>
    
        fetch('../html/exampleBack.html')
            .then(response => response.text())
            .then(html => {
                document.body.insertAdjacentHTML('beforeend', html);
            });
        function RWDTest() {
            //let RWD = document.getElementsByClassName("RWDTest");
            let RWD = document.body;
            if (RWD.className === "app sidebar-mini rtl sidenav-toggled pace-done") {
                RWD.className = "app sidebar-mini rtl pace-done";
            } else {
                RWD.className = "app sidebar-mini rtl sidenav-toggled pace-done";
            }
        }
        
//滑鼠foucs的顯示圖片        
		document.addEventListener('DOMContentLoaded', (event) => {
		<c:forEach items="${shops}" var="shop">
            const hoverButton_${shop.productId} = document.getElementById('hoverButton_${shop.productId}');
            const imageContainer_${shop.productId} = document.getElementById('imageContainer_${shop.productId}');

            hoverButton_${shop.productId}.addEventListener('mouseover', () => {
                imageContainer_${shop.productId}.style.display = 'block';
            });

            hoverButton_${shop.productId}.addEventListener('mouseout', () => {
                imageContainer_${shop.productId}.style.display = 'none';
            });

            hoverButton_${shop.productId}.addEventListener('mousemove', (e) => {
                const viewportHeight = window.innerHeight;//目前可視螢幕高度
                const mouseY = e.clientY; // 获取鼠标在页面中的垂直位置
            	if(mouseY + 320 < viewportHeight){
            		console.log("正常");
            		imageContainer_${shop.productId}.style.top = (e.clientY -275) + 'px'; 
               	 	imageContainer_${shop.productId}.style.left = (e.clientX -275) + 'px'; 
 	           	}else{
 	           		console.log("else");
 	           		imageContainer_${shop.productId}.style.top = (e.clientY -575) + 'px'; 
               		imageContainer_${shop.productId}.style.left = (e.clientX -275) + 'px';
 	           	}
            });
        </c:forEach>
        });
			
//刪除
        function deleteProduct(productId) {
            //跳出對話框
            var confirmDelete = confirm("是否要刪除此商品");
                        if (confirmDelete) {
                            $.ajax({
                                type: 'delete',
                                url: 'deleteShop', // 刪除的Servlet路徑
                                data: { productId: productId }, //回傳productId 跟serv講說要刪哪行
                                success: function (response) {
                                    $('tr[data-no="' + productId + '"]').remove(); //在網頁上刪除那行
                                    //location.reload();
                                },
                                error: function () {
                                    alert('發生錯誤');
                                }
                            });
                // 阻止表單提交
            }
            return false;
        }
//修改商品
        var originalValues = { };
        function editRow(productId) {
            // 將該行的商品標題、商品介紹和商品價格轉換為可編輯狀態
            originalValues[productId] = {
                productName: $('tr[data-no="' + productId + '"] td:eq(2)').text().trim(),
                productIntroduce: $('tr[data-no="' + productId + '"] td:eq(3)').text().trim(),
                productPrice: $('tr[data-no="' + productId + '"] td:eq(4)').text().trim(),
                productType: $('tr[data-no="' + productId + '"] td:eq(5)').text().trim(),
                xsSize: $('tr[data-no="' + productId + '"] td:eq(6)').text().trim(),
                sSize: $('tr[data-no="' + productId + '"] td:eq(7)').text().trim(),
                mSize: $('tr[data-no="' + productId + '"] td:eq(8)').text().trim(),
                lSize: $('tr[data-no="' + productId + '"] td:eq(9)').text().trim(),
                xlSize: $('tr[data-no="' + productId + '"] td:eq(10)').text().trim()
            };
		        // 創建下拉式選單的 HTML 字串R
	        var selectHTML = '<select style="width:75px;" name="productType">';
	            selectHTML += '<option value="Jacket" ' + (originalValues[productId].productType === 'Jacket' ? 'selected' : '') + '>Jacket</option>';
		        selectHTML += '<option value="Clothes" ' + (originalValues[productId].productType === 'Clothes' ? 'selected' : '') + '>Clothes</option>';
			    selectHTML += '<option value="Pants" ' + (originalValues[productId].productType === 'Pants' ? 'selected' : '') + '>Pants</option>';
				selectHTML += '</select>';
		
				$('tr[data-no="' + productId + '"] td:eq(2)').html('<input type="text" style="width:120px;" value="' + originalValues[productId].productName + '" name="productName">');
				$('tr[data-no="' + productId + '"] td:eq(3)').html('<input type="text" style="width:400px;" value="' + originalValues[productId].productIntroduce + '" name="productIntroduce">');
				$('tr[data-no="' + productId + '"] td:eq(4)').html('<input type="text" style="width:50px;" value="' + originalValues[productId].productPrice + '" name="productPrice">');
				$('tr[data-no="' + productId + '"] td:eq(5)').html(selectHTML);
				$('tr[data-no="' + productId + '"] td:eq(6)').html('<input type="text" style="width:50px;" value="' + originalValues[productId].xsSize + '" name="xsSize">');
				$('tr[data-no="' + productId + '"] td:eq(7)').html('<input type="text" style="width:50px;" value="' + originalValues[productId].sSize + '" name="sSize">');
				$('tr[data-no="' + productId + '"] td:eq(8)').html('<input type="text" style="width:50px;" value="' + originalValues[productId].mSize + '" name="mSize">');
				$('tr[data-no="' + productId + '"] td:eq(9)').html('<input type="text" style="width:50px;" value="' + originalValues[productId].lSize + '" name="lSize">');
				$('tr[data-no="' + productId + '"] td:eq(10)').html('<input type="text" style="width:50px;" value="' + originalValues[productId].xlSize + '" name="xlSize">');
				//刪除 修改和刪除按鈕
				$('tr[data-no="' + productId + '"] td:last-child').remove();
				$('tr[data-no="' + productId + '"] td:last-child').remove();
				// 添加確定按鈕
				$('tr[data-no="' + productId + '"]').append('<td style="position: relative;text-align: center;"><button class="btn btn-info" onclick="updateRow(' + productId + ')">確定</button>');
				$('tr[data-no="' + productId + '"]').append('<td style="position: relative;text-align: center;"><button class="btn btn-danger" onclick="cancelrestoreRow(' + productId + ')">取消</button>');
		}
//修改商品 >> 按下確認
        function updateRow(productId) {
            // 獲取新的商品標題、商品介紹和商品價格的值
            var productName = $('tr[data-no="' + productId + '"] input[name="productName"]').val();
            var productIntroduce = $('tr[data-no="' + productId + '"] input[name="productIntroduce"]').val();
            var productPrice = $('tr[data-no="' + productId + '"] input[name="productPrice"]').val();
            var productType = $('tr[data-no="' + productId + '"] select[name="productType"]').val();
            var xsSize = $('tr[data-no="' + productId + '"] input[name="xsSize"]').val();
            var sSize = $('tr[data-no="' + productId + '"] input[name="sSize"]').val();
            var mSize = $('tr[data-no="' + productId + '"] input[name="mSize"]').val();
            var lSize = $('tr[data-no="' + productId + '"] input[name="lSize"]').val();
            var xlSize = $('tr[data-no="' + productId + '"] input[name="xlSize"]').val();

            $.ajax({
                type: 'PUT',
                url: 'update', //Servlet路徑
                data: {
                    productId: productId,
                    productName: productName,
                    productIntroduce: productIntroduce,
                    productPrice: productPrice,
                    productType: productType,
                    xsSize: xsSize,
                    sSize: sSize,
                    mSize: mSize,
                    lSize: lSize,
                    xlSize: xlSize
                },
                success: function (response) {
                    // 更新成功後，將表格還原
                    restoreRow(productId);
                },
                error: function () {
                    alert('發生錯誤');
                }
            });
        }
//還原表格 修改商品 >> 按下確認 (應該可以合併去updateRow的function)
        function restoreRow(productId) {
            // 將表格還原為原始狀態
            $('tr[data-no="' + productId + '"] td:eq(2)').html($('tr[data-no="' + productId + '"] input[name="productName"]').val());
            $('tr[data-no="' + productId + '"] td:eq(3)').html($('tr[data-no="' + productId + '"] input[name="productIntroduce"]').val());
            $('tr[data-no="' + productId + '"] td:eq(4)').html($('tr[data-no="' + productId + '"] input[name="productPrice"]').val());
            $('tr[data-no="' + productId + '"] td:eq(5)').html($('tr[data-no="' + productId + '"] select[name="productType"]').val());
            $('tr[data-no="' + productId + '"] td:eq(6)').html($('tr[data-no="' + productId + '"] input[name="xsSize"]').val());
            $('tr[data-no="' + productId + '"] td:eq(7)').html($('tr[data-no="' + productId + '"] input[name="sSize"]').val());
            $('tr[data-no="' + productId + '"] td:eq(8)').html($('tr[data-no="' + productId + '"] input[name="mSize"]').val());
            $('tr[data-no="' + productId + '"] td:eq(9)').html($('tr[data-no="' + productId + '"] input[name="lSize"]').val());
            $('tr[data-no="' + productId + '"] td:eq(10)').html($('tr[data-no="' + productId + '"] input[name="xlSize"]').val());

            // 移除修改按鈕和刪除按鈕
            $('tr[data-no="' + productId + '"] td:last-child').remove();
            $('tr[data-no="' + productId + '"] td:last-child').remove();

            // 增加確定按鈕和輸入元素
            $('tr[data-no="' + productId + '"]').append('<td style="position: relative;text-align: center;"><button class="btn btn-success" onclick="editRow(' + productId + ')">修改</button>');
            $('tr[data-no="' + productId + '"]').append('<td style="position: relative;text-align: center;"><button class="btn btn-danger" onclick="deleteProduct(' + productId + ')">刪除</button>');
        }
//還原表格 修改商品 >> 按下取消
        function cancelrestoreRow(productId) {
            $('tr[data-no="' + productId + '"] td:eq(2)').html(originalValues[productId].productName);
            $('tr[data-no="' + productId + '"] td:eq(3)').html(originalValues[productId].productIntroduce);
            $('tr[data-no="' + productId + '"] td:eq(4)').html(originalValues[productId].productPrice);
            $('tr[data-no="' + productId + '"] td:eq(5)').html(originalValues[productId].productType);
            $('tr[data-no="' + productId + '"] td:eq(6)').html(originalValues[productId].xsSize);
            $('tr[data-no="' + productId + '"] td:eq(7)').html(originalValues[productId].sSize);
            $('tr[data-no="' + productId + '"] td:eq(8)').html(originalValues[productId].mSize);
            $('tr[data-no="' + productId + '"] td:eq(9)').html(originalValues[productId].lSize);
            $('tr[data-no="' + productId + '"] td:eq(10)').html(originalValues[productId].xlSize);

            // 显示修改按钮和删除按钮
            $('tr[data-no="' + productId + '"] td:last-child').remove();
            $('tr[data-no="' + productId + '"] td:last-child').remove();

            // 移除确认按钮和输入元素
            $('tr[data-no="' + productId + '"]').append('<td style="position: relative;text-align: center;"><button class="btn btn-success" onclick="editRow(' + productId + ')">修改</button>');
            $('tr[data-no="' + productId + '"]').append('<td style="position: relative;text-align: center;"><button class="btn btn-danger" onclick="deleteProduct(' + productId + ')">刪除</button>');
        }
//新增商品
        function addProductRow() {
            // 在表格最後一行插入新的行
            $('table').append('<tr data-no="-1">' +
                '<td name="newNo"></td>' +
                '<td style="max-width:80px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;" name="productImg">' +                
                	'<div class="upload-container">' +
		                '<input type="file" name="productImg" />' +
            		'</div>' +
                '</td>' +
                '<td><input type="text" style="width:80px;" name="newProduct"></td>' +
                '<td><input type="text" style="width:400px;" name="newIntroduce"></td>' +
                '<td><input type="text" style="width:50px;" name="productPrice"></td>' +
                '<td><select name="productType"><option value="Jacket">Jacket</option><option value="Clothes">Clothes</option><option value="Pants">Pants</option></select></td>' +
                '<td><input type="text" style="width:50px;" name="xsSize"></td>' +
                '<td><input type="text" style="width:50px;" name="sSize"></td>' +
                '<td><input type="text" style="width:50px;" name="mSize"></td>' +
                '<td><input type="text" style="width:50px;" name="lSize"></td>' +
                '<td><input type="text" style="width:50px;" name="xlSize"></td>' +
                '<td style="position: relative;text-align: center;"><button class="btn btn-info" onclick="saveNewProduct()">確定</button></td>' +
                '<td style="position: relative;text-align: center;"><button class="btn btn-danger" onclick="cancelNewProduct()">取消</button></td>' +
                '</tr>');
        }
//新增後按下確認
        function saveNewProduct() {
            
        	var formData = new FormData();
			// 獲取新商品的值
            var fileInput = $('input[name="productImg"]')[0];
            var files = fileInput.files;
            if (files.length > 0) {
                formData.append('productImg', files[0]);
            } else {
                alert('請選擇一個圖片');
                return;
            }
            
            var newProduct = $('input[name="newProduct"]').val();
            formData.append('productName', newProduct);
            
            var newIntroduce = $('input[name="newIntroduce"]').val();
            formData.append('productIntroduce', newIntroduce);
            
            var productPrice = $('input[name="productPrice"]').val();
            formData.append('productPrice', productPrice);
            
            var productType = $('select[name="productType"]').val();
            formData.append('productType', productType);
            
            var xsSize = $('input[name="xsSize"]').val();
            formData.append('xsSize', xsSize);
            var sSize = $('input[name="sSize"]').val();
            formData.append('sSize', sSize);
            var mSize = $('input[name="mSize"]').val();
            formData.append('mSize', mSize);
            var lSize = $('input[name="lSize"]').val();
            formData.append('lSize', lSize);
            var xlSize = $('input[name="xlSize"]').val();
            formData.append('xlSize', xlSize);

            $.ajax({
                type: 'POST',
                url: 'addShop', //Servlet路徑
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    alert('新增成功');
                    //console.log("con:"+response);
                    location.reload();
                },
                error: function () {
                    alert('發生錯誤');
                }
            });
        }
//取消新增商品按鈕做的func
        function cancelNewProduct() {
            // 移除新商品行
            $('tr[data-no="-1"]').remove();
        }
//自動帶入值
function autoinput() {
            $('input[name="newProduct"]').val('毛毛衣');
            $('input[name="newIntroduce"]').val('毛毛蟲做的');
            $('input[name="productPrice"]').val('199');
            $('select[name="productType"]').val('Pants'); // 默认选择 Jacket 类型
            $('input[name="xsSize"]').val('10');
            $('input[name="sSize"]').val('20');
            $('input[name="mSize"]').val('30');
            $('input[name="lSize"]').val('40');
            $('input[name="xlSize"]').val('50');
        }        
        
    </script>

</body>

</html>