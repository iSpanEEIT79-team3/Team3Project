<%@ page language="java" contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                            輸入欲查詢的商品編號 : <input type="text" name="productid" />
                            <p>
                                <input type="submit" value="確定" />
                        </form>
                    </div>
                    <div class="box middle-box">
                        <h2>查詢商品名稱</h2>
                        <form method="post" action="/findByproductname">
                            輸入欲查詢的商品名稱 : <input type="text" name="productname" />
                            <p>
                                <input type="submit" value="確定" />
                        </form>
                    </div>
                    <div class="box">
                        <h2>查詢商品類別</h2>
                        <form method="post" action="/findByproducttype">
                            輸入欲查詢的商品類別 : <br><select name="producttype">
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
                            <input type="hidden" name="productid" value="${shop.productid}" />
                    <tr class="row" data-no="${shop.productid}">
                        <td>${shop.productid}</td>
                        <td class="photo">
                            <form method="post" enctype="multipart/form-data" onsubmit="return false;">
                                <c:choose>
                                    <c:when test="${not empty shop.productimg}">
                                        <img src="${shop.productimg}" alt="uploading" style="height: 150px;">
                                    </c:when>
                                    <c:otherwise>
                                        <div class="upload-container">
                                            <input type="file" name="productimg" />
                                            <button onclick="uploadphoto(${shop.productid})">上傳</button>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </form>
                        </td>
                        <td style="width:100px;">${shop.productname}</td>
                        <td style="width:125px;">${shop.productintroduce}</td>
                        <td style="width:75px;">${shop.productprice}</td>
                        <td style="width:75px;">${shop.productquantity}</td>
                        <td style="width:75px;">${shop.producttype}</td>
                        <td><button onclick="editRow(${shop.productid})">修改</button></td>
                        <td><button onclick="deleteProduct(${shop.productid})">刪除</button></td>
                        <c:set var="count" value="${s.count}" />
                    </tr>
                    </c:forEach>
                </table>
                <br>
                <button onclick="addProductRow()">新增商品</button>
                <h3>共<span id="Count">${count}</span>件商品</h3>
                <form method="get" action="getall">
                    <button type="submit">顯示全部</button>
                </form>
            </div>
        </body>
        <script>

            //刪除
            function deleteProduct(productid) {
                $.ajax({
                    type: 'POST',
                    url: 'del', // 刪除的Servlet路徑
                    data: { productid: productid }, //回傳productid 跟serv講說要刪哪行
                    success: function (response) {
                        $('tr[data-no="' + productid + '"]').remove(); //在網頁上刪除那行
                        //變更下方查詢到幾件商品的數字
                        var currentCount = parseInt($('#Count').text());
                        $('#Count').text(currentCount - 1);
                    },
                    error: function () {
                        alert('發生錯誤');
                    }
                });
                // 阻止表單提交
                return false;
            }

            //修改
            var originalValues = {};
            function editRow(productid) {
                // 將該行的商品標題、商品介紹和商品價格轉換為可編輯狀態
                originalValues[productid] = {
                    productname: $('tr[data-no="' + productid + '"] td:eq(2)').text().trim(),
                    productintroduce: $('tr[data-no="' + productid + '"] td:eq(3)').text().trim(),
                    productprice: $('tr[data-no="' + productid + '"] td:eq(4)').text().trim(),
                    productquantity: $('tr[data-no="' + productid + '"] td:eq(5)').text().trim(),
                    producttype: $('tr[data-no="' + productid + '"] td:eq(6)').text().trim()
                };
                // 創建下拉式選單的 HTML 字串
                var selectHTML = '<select style="width:50px;" name="producttype">';
                selectHTML += '<option value="狗狗" ' + (originalValues[productid].producttype === '狗狗' ? 'selected' : '') + '>狗狗</option>';
                selectHTML += '<option value="貓咪" ' + (originalValues[productid].producttype === '貓咪' ? 'selected' : '') + '>貓咪</option>';
                selectHTML += '<option value="老鼠" ' + (originalValues[productid].producttype === '老鼠' ? 'selected' : '') + '>老鼠</option>';
                selectHTML += '</select>';

                $('tr[data-no="' + productid + '"] td:eq(2)').html('<input type="text" style="width:75px;" value="' + originalValues[productid].productname + '" name="productname">');
                $('tr[data-no="' + productid + '"] td:eq(3)').html('<input type="text" style="width:100px;" value="' + originalValues[productid].productintroduce + '" name="productintroduce">');
                $('tr[data-no="' + productid + '"] td:eq(4)').html('<input type="text" style="width:50px;" value="' + originalValues[productid].productprice + '" name="productprice">');
                $('tr[data-no="' + productid + '"] td:eq(5)').html('<input type="text" style="width:50px;" value="' + originalValues[productid].productquantity + '" name="productquantity">');
                $('tr[data-no="' + productid + '"] td:eq(6)').html(selectHTML);
                //刪除 修改和刪除按鈕
                $('tr[data-no="' + productid + '"] td:last-child').remove();
                $('tr[data-no="' + productid + '"] td:last-child').remove();
                // 添加確定按鈕
                $('tr[data-no="' + productid + '"]').append('<td><button class="confirm-button" onclick="updateRow(' + productid + ')">確定</button>');
                $('tr[data-no="' + productid + '"]').append('<td><button class="confirm-button" onclick="cancelrestoreRow(' + productid + ')">取消</button>');
            }




            //修改後按下確認
            function updateRow(productid) {
                // 獲取新的商品標題、商品介紹和商品價格的值
                var productname = $('tr[data-no="' + productid + '"] input[name="productname"]').val();
                var productintroduce = $('tr[data-no="' + productid + '"] input[name="productintroduce"]').val();
                var productprice = $('tr[data-no="' + productid + '"] input[name="productprice"]').val();
                var productquantity = $('tr[data-no="' + productid + '"] input[name="productquantity"]').val();
                var producttype = $('tr[data-no="' + productid + '"] select[name="producttype"]').val();

                $.ajax({
                    type: 'POST',
                    url: 'update', //Servlet路徑
                    data: {
                        productid: productid,
                        productname: productname,
                        productintroduce: productintroduce,
                        productprice: productprice,
                        productquantity: productquantity,
                        producttype: producttype
                    },
                    success: function (response) {
                        // 更新成功後，將表格還原
                        restoreRow(productid);
                    },
                    error: function () {
                        alert('發生錯誤');
                    }
                });
            }
            //還原表格(按下確認)
            function restoreRow(productid) {
                // 將表格還原為原始狀態
                $('tr[data-no="' + productid + '"] td:eq(2)').html($('tr[data-no="' + productid + '"] input[name="productname"]').val());
                $('tr[data-no="' + productid + '"] td:eq(3)').html($('tr[data-no="' + productid + '"] input[name="productintroduce"]').val());
                $('tr[data-no="' + productid + '"] td:eq(4)').html($('tr[data-no="' + productid + '"] input[name="productprice"]').val());
                $('tr[data-no="' + productid + '"] td:eq(5)').html($('tr[data-no="' + productid + '"] input[name="productquantity"]').val());
                $('tr[data-no="' + productid + '"] td:eq(6)').html($('tr[data-no="' + productid + '"] select[name="producttype"]').val());


                // 移除修改按鈕和刪除按鈕
                $('tr[data-no="' + productid + '"] td:last-child').remove();
                $('tr[data-no="' + productid + '"] td:last-child').remove();

                // 增加確定按鈕和輸入元素
                $('tr[data-no="' + productid + '"]').append('<td><button class="confirm-button" onclick="editRow(' + productid + ')">修改</button>');
                $('tr[data-no="' + productid + '"]').append('<td><button class="confirm-button" onclick="deleteProduct(' + productid + ')">刪除</button>');
            }
            //還原表格(按下取消)
            function cancelrestoreRow(productid) {
                $('tr[data-no="' + productid + '"] td:eq(2)').html(originalValues[productid].productname);
                $('tr[data-no="' + productid + '"] td:eq(3)').html(originalValues[productid].productintroduce);
                $('tr[data-no="' + productid + '"] td:eq(4)').html(originalValues[productid].productprice);
                $('tr[data-no="' + productid + '"] td:eq(5)').html(originalValues[productid].productquantity);
                $('tr[data-no="' + productid + '"] td:eq(6)').html(originalValues[productid].producttype);

                // 显示修改按钮和删除按钮
                $('tr[data-no="' + productid + '"] td:last-child').remove();
                $('tr[data-no="' + productid + '"] td:last-child').remove();

                // 移除确认按钮和输入元素
                $('tr[data-no="' + productid + '"]').append('<td><button class="confirm-button" onclick="editRow(' + productid + ')">修改</button>');
                $('tr[data-no="' + productid + '"]').append('<td><button class="confirm-button" onclick="deleteProduct(' + productid + ')">刪除</button>');
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
                        productname: newProduct,
                        productintroduce: newIntroduce,
                        productprice: newMoney,
                        productquantity: newProductquantity,
                        producttype: newShoptype
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
            function uploadphoto(productid) {
                var uploadButton = $('tr[data-no="' + productid + '"] button');
                //uploadButton.prop('disabled', true); // 禁用按鈕

                // 创建 FormData 对象，用于发送包含文件的表单数据
                var formData = new FormData();
                formData.append('productid', productid);
                // 获取上传的图片文件
                var imgInput = $('tr[data-no="' + productid + '"] input[name="productimg"]')[0];
                var imgFile = imgInput.files[0];
                // 将图片文件添加到 FormData 中
                formData.append('productimg', imgFile);

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