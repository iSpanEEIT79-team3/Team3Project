/**
 * 
 */

function readmore(order) {
    // 彈出視窗
    let popup = document.getElementById("popup");
    popup.style.display = "block";
    popup.style.position = 'fixed';
    popup.style.left = '50%';
    popup.style.top = '50%';
    popup.style.transform = 'translate(-50%, -50%)';
    popup.style.padding = '20px';
    popup.style.boxShadow = '0 0 10px rgba(0, 0, 0, 0.5)';
    popup.style.zIndex = '1000';
    popup.style.width = '80%'; // 设置宽度
    popup.style.maxWidth = '800px'; // 设置最大宽度
    popup.style.height = 'auto'; // 设置高度
    popup.style.maxHeight = '80%'; // 设置最大高度
    popup.style.overflowY = 'auto'; // 如果内容超出容器高度，显示滚动条

    // 關閉按鈕
    let closeButton = document.getElementById("closeButton");
    closeButton.onclick = function() {
        popup.style.display = "none";
        
        // 清空 popup 內元素
        clearPopupContent();
    };

    // 填充基本資料
    document.getElementById("Username").innerText = order.userContactNew.name;
    document.getElementById("orderDetailTime").innerText = order.orderDate;
    document.getElementById("address").innerText = order.userContactNew.address;
    document.getElementById("UserId").innerText = order.userContactNew.contactId;
    document.getElementById("email").innerText = order.userContactNew.email;
    document.getElementById("phone").innerText = order.userContactNew.phone;
    document.getElementById("totlePrice").innerText = order.totalPrice;

    // 填充訂單詳情
    let table = document.getElementById("readmoreTable");
    table.innerHTML = ''; // 清空表格

    // 創建表頭
    let thead = document.createElement('thead');
    thead.style.backgroundColor = '#EEBA7E';
    let headerRow = thead.insertRow();
    headerRow.innerHTML = '<th>商品編號</th>' +
        '<th>商品名稱</th>' +
        '<th>商品價格</th>' +
        '<th>商品數量</th>' +
        '<th>金額</th>';
    table.appendChild(thead);

    // 創建表格主體
    let tbody = document.createElement("tbody");
    table.appendChild(tbody);
    order.orderDetails.forEach(function(orderDetail) {
        let row = tbody.insertRow();
        let flds = [orderDetail.productNum, orderDetail.productName, orderDetail.productPrice, orderDetail.productQuantity, orderDetail.orderTotalPrice];
        for (let i = 0; i < flds.length; i++) {
            row.insertCell(i).innerHTML = flds[i];
        }
    });
}

function clearPopupContent() {
    document.getElementById("Username").innerText = '';
    document.getElementById("orderDetailTime").innerText = '';
    document.getElementById("address").innerText = '';
    document.getElementById("UserId").innerText = '';
    document.getElementById("email").innerText = '';
    document.getElementById("phone").innerText = '';
    document.getElementById("totlePrice").innerText = '';
    document.getElementById("readmoreTable").innerHTML = '';
}



