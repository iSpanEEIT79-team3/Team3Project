<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>商品資料</title>
            <style>
                .row {
                    height: 150px;
                }

                .photo {
                    margin: 0;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    max-width: 200px;
                    max-height: 150px;
                    height: 150px;
                    overflow: hidden;
                }

                .confirm-button {
                    align="center"
                }

                .upload-container {
                    margin-left: 80px;
                }

                .container {
                    max-width: 900px;
                    margin: 0 auto;
                    display: flex;
                }

                .box {
                    flex: 1;
                    margin-right: 10px;
                    padding: 10px;
                }

                .middle-box {
                    border-left: 1px solid gray;
                    border-right: 1px solid gray;
                    padding: 10px;
                }

                .tablecontainer {
        margin-left: auto; /* Move the table to the right */
        margin-right: auto; /* Move the table to the right */
        /* Add other styles as needed */
                }
            </style>
        </head>

        <body style="background-color:#fdf5e6">

                <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <div align="center">
                    <div class="leftcontainer"></div>
                <div class="container">
                    <div class="box">
                        <h2>查詢商品編號</h2>
                        <form method="post" action="/findByproductid">
                            輸入欲查詢的商品編號 : <input type="text" name="productId" />
                            <p>
                                <input type="submit" value="確定" />
                        </form>
                    </div>
                    <div class="box middle-box">
                        <h2>查詢商品名稱</h2>
                        <form method="post" action="/findByproductname">
                            輸入欲查詢的商品名稱 : <input type="text" name="productName" />
                            <p>
                                <input type="submit" value="確定" />
                        </form>
                    </div>
                    <div class="box">
                        <h2>查詢商品類別</h2>
                        <form method="post" action="/findByproducttype">
                            輸入欲查詢的商品類別 : <br><select name="productType">
                                <option value="狗狗">狗狗</option>
                                <option value="貓咪">貓咪</option>
                                <option value="老鼠">老鼠</option>
                            </select>
                            <br><br>
                            <input type="submit" value="確定" />
                        </form>
                    </div>
                </div>


                <h2>商品資料</h2>
                <c:if test="${not empty shops}">
                <p>回傳過來的有 ${fn:length(shops)} 筆資料</p>
                </c:if>
<!-- 商品 -->                
                <table class="tablecontainer" border="1">
                    <tr style="background-color:#a8fefa">
                        <th>商品編號</th>
                        <th>照片</th>
                        <th>商品名稱</th>
                        <th>詳細介紹</th>
                        <th>價格</th>
                        <th>庫存</th>
                        <th>分類</th>
                        <th>修改</th>
                        <th>刪除</th>
						
                        <c:forEach items="${shops}" var="shop" varStatus="s">
                            <input type="hidden" name="productId" value="${shop.productId}" />
                    <tr class="row" data-no="${shop.productId}">
                        <td>${shop.productId}</td>
                        <td class="photo">
                            <form method="post" enctype="multipart/form-data" onsubmit="return false;">
                                <c:choose>
                                    <c:when test="${not empty shop.productImg}">
                                        <img src="${shop.productImg}" alt="uploading" style="height: 150px;">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="upload-container">
                                            <input type="file" name="productImg" />
                                            <button onclick="uploadphoto(${shop.productId})">上傳</button>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </td>
                        <td style="width:100px;">${shop.productName}</td>
                        <td style="width:125px;">${shop.productIntroduce}</td>
                        <td style="width:75px;">${shop.productPrice}</td>
                        <td style="width:75px;"></td>
                        <td style="width:75px;">${shop.productType}</td>
                        <td><button onclick="editRow(${shop.productId})">修改</button></td>
                        <td><button onclick="deleteProduct(${shop.productId})">刪除</button></td>
                        <c:set var="count" value="${s.count}" />
                    </tr>
                    </c:forEach>
                </table>
<!-- /商品 -->               
<!-- 庫存 -->             
				<c:if test="${fn:length(shops) == 1}">
                <table class="tablecontainer" border="1">       
             		<th>商品編號</th>
                    <th>xsSize</th>
                    <th>sSize</th>
                    <th>mSize</th>
                    <th>lSize</th> 
                    <th>xlSize</th> 
                    <th>修改</th> 
                    <th>刪除</th> 
                	<c:forEach items="${shopQuan}" var="shop" varStatus="s">
                            <input type="hidden" name="productId" value="${shop.productId}" />
                    <tr class="row" data-no="Quan">
                    	<td>${shop.productId}</td>
                        <td style="width:75px;">${shop.xsSize}</td>
                        <td style="width:75px;">${shop.sSize}</td>
                        <td style="width:75px;">${shop.mSize}</td>
                        <td style="width:75px;">${shop.lSize}</td>
                        <td style="width:75px;">${shop.xlSize}</td>
                        <td><button onclick="editQuan(${shop.productId})">修改</button></td>
                        <td><button onclick="deleteProduct(${shop.productId})">刪除</button></td>
                    </tr>
                    </c:forEach>
                </table>
               </c:if>
<!-- /庫存 -->
                <br>
				<c:if test="${fn:length(shops) != 1}">
                <button onclick="addProductRow()">新增商品(未實作)</button>
                <h3>共<span id="Count">${count}</span>件商品</h3>
                </c:if>
                <form method="get" action="getAll">
                    <button type="submit">顯示全部</button>
                </form>
            </div>
        </body>
        <script>

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
                        //變更下方查詢到幾件商品的數字
                        var currentCount = parseInt($('#Count').text());
                        $('#Count').text(currentCount - 1);
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
            var originalValues = {};
            function editRow(productId) {
                // 將該行的商品標題、商品介紹和商品價格轉換為可編輯狀態
                originalValues[productId] = {
                		productName: $('tr[data-no="' + productId + '"] td:eq(2)').text().trim(),
                        productIntroduce: $('tr[data-no="' + productId + '"] td:eq(3)').text().trim(),
                        productPrice: $('tr[data-no="' + productId + '"] td:eq(4)').text().trim(),
                        productquantity: $('tr[data-no="' + productId + '"] td:eq(5)').text().trim(),
                        productType: $('tr[data-no="' + productId + '"] td:eq(6)').text().trim()
                };
                // 創建下拉式選單的 HTML 字串
                var selectHTML = '<select style="width:50px;" name="productType">';
                selectHTML += '<option value="狗狗" ' + (originalValues[productId].productType === '狗狗' ? 'selected' : '') + '>狗狗</option>';
                selectHTML += '<option value="貓咪" ' + (originalValues[productId].productType === '貓咪' ? 'selected' : '') + '>貓咪</option>';
                selectHTML += '<option value="老鼠" ' + (originalValues[productId].productType === '老鼠' ? 'selected' : '') + '>老鼠</option>';
                selectHTML += '</select>';

                $('tr[data-no="' + productId + '"] td:eq(2)').html('<input type="text" style="width:75px;" value="' + originalValues[productId].productName + '" name="productName">');
                $('tr[data-no="' + productId + '"] td:eq(3)').html('<input type="text" style="width:100px;" value="' + originalValues[productId].productIntroduce + '" name="productIntroduce">');
                $('tr[data-no="' + productId + '"] td:eq(4)').html('<input type="text" style="width:50px;" value="' + originalValues[productId].productPrice + '" name="productPrice">');
                $('tr[data-no="' + productId + '"] td:eq(5)').html('<input type="text" style="width:50px;" value="' + originalValues[productId].productquantity + '" name="productquantity">');
                $('tr[data-no="' + productId + '"] td:eq(6)').html(selectHTML);
                //刪除 修改和刪除按鈕
                $('tr[data-no="' + productId + '"] td:last-child').remove();
                $('tr[data-no="' + productId + '"] td:last-child').remove();
                // 添加確定按鈕
                $('tr[data-no="' + productId + '"]').append('<td><button class="confirm-button" onclick="updateRow(' + productId + ')">確定</button>');
                $('tr[data-no="' + productId + '"]').append('<td><button class="confirm-button" onclick="cancelrestoreRow(' + productId + ')">取消</button>');
            }
//修改庫存
            var QuanoriginalValues = {};
            function editQuan(productId) {
                // 將該行的商品標題、商品介紹和商品價格轉換為可編輯狀態
                QuanoriginalValues[productId] = {
                		xsSize: $('tr[data-no="Quan"] td:eq(1)').text().trim(),
                		sSize: $('tr[data-no="Quan"] td:eq(2)').text().trim(),
                		mSize: $('tr[data-no="Quan"] td:eq(3)').text().trim(),
                		lSize: $('tr[data-no="Quan"] td:eq(4)').text().trim(),
                		xlSize: $('tr[data-no="Quan"] td:eq(5)').text().trim()
                };


                $('tr[data-no="Quan"] td:eq(1)').html('<input type="text" style="width:75px;" value="' + QuanoriginalValues[productId].xsSize + '" name="xsSize">');
                $('tr[data-no="Quan"] td:eq(2)').html('<input type="text" style="width:100px;" value="' + QuanoriginalValues[productId].sSize + '" name="sSize">');
                $('tr[data-no="Quan"] td:eq(3)').html('<input type="text" style="width:50px;" value="' + QuanoriginalValues[productId].mSize + '" name="mSize">');
                $('tr[data-no="Quan"] td:eq(4)').html('<input type="text" style="width:50px;" value="' + QuanoriginalValues[productId].lSize + '" name="lSize">');
                $('tr[data-no="Quan"] td:eq(5)').html('<input type="text" style="width:50px;" value="' + QuanoriginalValues[productId].xlSize + '" name="xlSize">');
                //刪除 修改和刪除按鈕
                $('tr[data-no="Quan"] td:last-child').remove();
                $('tr[data-no="Quan"] td:last-child').remove();
                // 添加確定按鈕
                $('tr[data-no="Quan"]').append('<td><button class="confirm-button" onclick="QuanupdateRow(' + productId + ')">確定</button>');
                $('tr[data-no="Quan"]').append('<td><button class="confirm-button" onclick="QuancancelrestoreRow(' + productId + ')">取消</button>');
            }


//修改商品 >> 按下確認
            function updateRow(productId) {
                // 獲取新的商品標題、商品介紹和商品價格的值
                var productName = $('tr[data-no="' + productId + '"] input[name="productName"]').val();
                var productIntroduce = $('tr[data-no="' + productId + '"] input[name="productIntroduce"]').val();
                var productPrice = $('tr[data-no="' + productId + '"] input[name="productPrice"]').val();
                var productquantity = $('tr[data-no="' + productId + '"] input[name="productquantity"]').val();
                var productType = $('tr[data-no="' + productId + '"] select[name="productType"]').val();

                $.ajax({
                    type: 'PUT',
                    url: 'update', //Servlet路徑
                    data: {
                        productId: productId,
                        productName: productName,
                        productIntroduce: productIntroduce,
                        productPrice: productPrice,
                        productquantity: productquantity,
                        productType: productType
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
//修改庫存 >> 按下確認
            function QuanupdateRow(productId) {
                // 獲取新的商品標題、商品介紹和商品價格的值
                var xsSize = $('tr[data-no="Quan"] input[name="xsSize"]').val();
                var sSize = $('tr[data-no="Quan"] input[name="sSize"]').val();
                var mSize = $('tr[data-no="Quan"] input[name="mSize"]').val();
                var lSize = $('tr[data-no="Quan"] input[name="lSize"]').val();
                var xlSize = $('tr[data-no="Quan"] input[name="xlSize"]').val();

                $.ajax({
                    type: 'PUT',
                    url: 'updateQuan', //Servlet路徑
                    data: {
                    	productId: productId,
                    	xsSize: xsSize,
                    	sSize: sSize,
                    	mSize: mSize,
                    	lSize: lSize,
                    	xlSize: xlSize,
                    },
                    success: function (response) {
                        // 更新成功後，將表格還原
                        QuanrestoreRow(productId);
                    },
                    error: function () {
                        alert('發生錯誤');
                    }
                });
            }
//還原表格 修改商品 >> 按下確認 (應該可以合併去updateRow的function)
            function restoreRow(productId) {
                // 將表格還原為原始狀態
                $('tr[data-no="' + productId + '"] td:eq(1)').html($('tr[data-no="' + productId + '"] input[name="productName"]').val());
                $('tr[data-no="' + productId + '"] td:eq(2)').html($('tr[data-no="' + productId + '"] input[name="productIntroduce"]').val());
                $('tr[data-no="' + productId + '"] td:eq(3)').html($('tr[data-no="' + productId + '"] input[name="productPrice"]').val());
                $('tr[data-no="' + productId + '"] td:eq(4)').html($('tr[data-no="' + productId + '"] input[name="productquantity"]').val());
                $('tr[data-no="' + productId + '"] td:eq(5)').html($('tr[data-no="' + productId + '"] select[name="productType"]').val());


                // 移除修改按鈕和刪除按鈕
                $('tr[data-no="' + productId + '"] td:last-child').remove();
                $('tr[data-no="' + productId + '"] td:last-child').remove();

                // 增加確定按鈕和輸入元素
                $('tr[data-no="' + productId + '"]').append('<td><button class="confirm-button" onclick="editRow(' + productId + ')">修改</button>');
                $('tr[data-no="' + productId + '"]').append('<td><button class="confirm-button" onclick="deleteProduct(' + productId + ')">刪除</button>');
            }
//還原表格 修改商品 >> 按下取消
            function cancelrestoreRow(productId) {
                $('tr[data-no="' + productId + '"] td:eq(1)').html(originalValues[productId].productName);
                $('tr[data-no="' + productId + '"] td:eq(2)').html(originalValues[productId].productIntroduce);
                $('tr[data-no="' + productId + '"] td:eq(3)').html(originalValues[productId].productPrice);
                $('tr[data-no="' + productId + '"] td:eq(4)').html(originalValues[productId].productquantity);
                $('tr[data-no="' + productId + '"] td:eq(5)').html(originalValues[productId].productType);

                // 显示修改按钮和删除按钮
                $('tr[data-no="' + productId + '"] td:last-child').remove();
                $('tr[data-no="' + productId + '"] td:last-child').remove();

                // 移除确认按钮和输入元素
                $('tr[data-no="' + productId + '"]').append('<td><button class="confirm-button" onclick="editRow(' + productId + ')">修改</button>');
                $('tr[data-no="' + productId + '"]').append('<td><button class="confirm-button" onclick="deleteProduct(' + productId + ')">刪除</button>');
            }
//還原表格 修改庫存 >> 按下確認
            function QuanrestoreRow(productId) {
                // 將表格還原為原始狀態
                $('tr[data-no="Quan"] td:eq(1)').html($('tr[data-no="Quan"] input[name="xsSize"]').val());
                $('tr[data-no="Quan"] td:eq(2)').html($('tr[data-no="Quan"] input[name="sSize"]').val());
                $('tr[data-no="Quan"] td:eq(3)').html($('tr[data-no="Quan"] input[name="mSize"]').val());
                $('tr[data-no="Quan"] td:eq(4)').html($('tr[data-no="Quan"] input[name="lSize"]').val());
                $('tr[data-no="Quan"] td:eq(5)').html($('tr[data-no="Quan"] input[name="xlSize"]').val());


                // 移除修改按鈕和刪除按鈕
                $('tr[data-no="Quan"] td:last-child').remove();
                $('tr[data-no="Quan"] td:last-child').remove();

                // 增加確定按鈕和輸入元素
                $('tr[data-no="Quan"]').append('<td><button class="confirm-button" onclick="editQuan(' + productId + ')">修改</button>');
                $('tr[data-no="Quan"]').append('<td><button class="confirm-button" onclick="deleteProduct(' + productId + ')">刪除</button>');
            }
//還原表格 修改庫存 >> 按下取消
            function QuancancelrestoreRow(productId) {
                $('tr[data-no="Quan"] td:eq(1)').html(QuanoriginalValues[productId].xsSize);
                $('tr[data-no="Quan"] td:eq(2)').html(QuanoriginalValues[productId].sSize);
                $('tr[data-no="Quan"] td:eq(3)').html(QuanoriginalValues[productId].mSize);
                $('tr[data-no="Quan"] td:eq(4)').html(QuanoriginalValues[productId].lSize);
                $('tr[data-no="Quan"] td:eq(5)').html(QuanoriginalValues[productId].xlSize);

                // 显示修改按钮和删除按钮
                $('tr[data-no="Quan"] td:last-child').remove();
                $('tr[data-no="Quan"] td:last-child').remove();

                // 移除确认按钮和输入元素
                $('tr[data-no="Quan"]').append('<td><button class="confirm-button" onclick="editQuan(' + productId + ')">修改</button>');
                $('tr[data-no="Quan"]').append('<td><button class="confirm-button" onclick="deleteProduct(' + productId + ')">刪除</button>');
            }


            //新增

            function addProductRow() {
                // 在表格最後一行插入新的行
                $('table').append('<tr class="row" data-no="-1">' +
                    '<td name="newNo"></td>' +
                    '<td name="newImg"></td>' +
                    '<td><input type="text" style="width:75px;" name="newProduct"></td>' +
                    '<td><input type="text" style="width:100px;" name="newIntroduce"></td>' +
                    '<td><input type="text" style="width:100px;" name="newProductquantity"></td>' +
                    '<td><input type="text" style="width:50px;" name="newMoney"></td>' +
                    '<td><select name="newShoptype"><option value="狗狗">狗狗</option><option value="貓咪">貓咪</option><option value="老鼠">老鼠</option></select></td>' +
                    '<td><button onclick="saveNewProduct()">確定</button></td>' +
                    '<td><button onclick="cancelNewProduct()">取消</button></td>' +
                    '</tr>');
            }

            //新增後按下確認
            function saveNewProduct() {
                // 獲取新商品的值
                var newProduct = $('input[name="newProduct"]').val();
                var newIntroduce = $('input[name="newIntroduce"]').val();
                var newMoney = $('input[name="newMoney"]').val();
                var newProductquantity = $('input[name="newProductquantity"]').val();
                var newShoptype = $('select[name="newShoptype"]').val();

                $.ajax({
                    type: 'POST',
                    url: 'addShop', //Servlet路徑
                    data: {
                        productName: newProduct,
                        productIntroduce: newIntroduce,
                        productPrice: newMoney,
                        productquantity: newProductquantity,
                        productType: newShoptype
                    },
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

            //上傳照片
            function uploadphoto(productId) {
                var uploadButton = $('tr[data-no="' + productId + '"] button');
                //uploadButton.prop('disabled', true); // 禁用按鈕

                // 创建 FormData 对象，用于发送包含文件的表单数据
                var formData = new FormData();
                formData.append('productId', productId);
                // 获取上传的图片文件
                var imgInput = $('tr[data-no="' + productId + '"] input[name="productImg"]')[0];
                var imgFile = imgInput.files[0];
                // 将图片文件添加到 FormData 中
                formData.append('productImg', imgFile);

                $.ajax({
                    type: 'POST',
                    url: 'uploadphoto', // 的 Servlet 路径
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        setTimeout(function () {
                            alert("上傳成功!!!");
                            // 更新成功后，延迟1秒后刷新頁面
                            location.reload();
                        }, 250); // 1000 毫秒 = 1 秒
                    },
                    error: function () {
                        alert('發生錯誤');
                    }
                });
            }

            fetch('/back')
                .then(response => response.text())
                .then(html => {
                    //內容
                    $('.leftcontainer').html(html);
                })
                .catch(error => console.error('Error fetching back.html', error));

        </script>

        </html>