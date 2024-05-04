


let parentForm = document.createElement('form');
parentForm.setAttribute("id", "ParentForm");


let addOrderButton = document.createElement('button');
addOrderButton.textContent = "新增訂單資訊";
addOrderButton.setAttribute("onclick", "addOrderDetail()");
addOrderButton.setAttribute("type", "button");

let submitButton = document.createElement('button');
submitButton.textContent = "送出";
submitButton.addEventListener("click", submitForm);

let orderNoteInput = document.createElement('input');
orderNoteInput.setAttribute("type", "text");
orderNoteInput.setAttribute("name", "orderNote");
orderNoteInput.setAttribute("placeholder", "備註");


let idUsersInput = document.createElement('input');
idUsersInput.setAttribute("type", "text");
idUsersInput.setAttribute("name", "idUsers");
idUsersInput.setAttribute("placeholder", "會員編號");



// 将按钮添加到父表单中
parentForm.appendChild(addOrderButton);
parentForm.appendChild(idUsersInput);
parentForm.appendChild(orderNoteInput);
parentForm.appendChild(submitButton);

// 将父表单添加到页面中

document.body.appendChild(parentForm);

// 添加订单详情
function addOrderDetail() {
	let orderDetailForm = document.createElement('form');
	orderDetailForm.className = 'orderDetailForm';

	let orderDetailDiv = document.createElement('div');
	orderDetailDiv.className = 'orderDetail';
	orderDetailDiv.innerHTML = `
        <label for="productNum">產品編號:</label>
        <input type="text" class="productNum" name="productNum">
        <br>
        
        <label for="productName">產品名稱:</label>
        <input type="text" class="productName" name="productName">
        <br>
        <label for="productPrice">商品價格:</label>
        <input type="text" class="productPrice" name="productPrice">
        <br>
        <label for="productQuantity">商品數量:</label>
        <input type="text" class="productQuantity" name="productQuantity">
        <br>
        <label for="orderTotalPrice">商品總價:</label>
        <input type="text" class="orderTotalPrice" name="orderTotalPrice">
        
         <button type="button" onclick="removeOrderDetail(this)">刪除</button>
         <hr>
    `;
	orderDetailForm.appendChild(orderDetailDiv);

	parentForm.insertBefore(orderDetailForm, submitButton); // 插入到提交按钮之前
}

// 提交表单
function submitForm(event) {
	event.preventDefault();

	let formData = [];
	document.querySelectorAll('.orderDetailForm').forEach(form => {
		let formDataItem = {};
		form.querySelectorAll('input').forEach(input => {
			formDataItem[input.name] = input.value;
		});
		formData.push(formDataItem);
	});

	let data = {
		"userContactNew": { "contactId": idUsersInput.value },
		"orderNote": orderNoteInput.value,
		"orderDetails": formData
	};

	console.log(data);

	console.log("------------------");

	fetch('http://localhost:8080/orders', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json();
		})
		.then(order => {
			console.log('成功收到回傳的 JSON:', order);

			orderNoteInput.value = "";
			idUsersInput.value = "";

			let forms = document.getElementsByClassName("orderDetailForm");
			while (forms.length > 0) {
				forms[0].parentNode.removeChild(forms[0]); // 從其父節點中移除第一個表單元素
			}



			let row = tbody.insertRow();
			let flds = [order.orderId, order.userContactNew.contactId, order.totalPrice, order.payStatus, order.shippingStatus, order.orderDate, order.shippingDate, order.payDeadline, order.orderNote];
			for (let i = 0; i < flds.length; i++) {
				row.insertCell(i).innerHTML = flds[i];
			}
			row.insertCell(flds.length).innerHTML = '<button onclick="updateOrder(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">更改</button>';
			row.insertCell(flds.length + 1).innerHTML = '<button onclick="deleteOrder(' + order.orderId + ')">刪除</button>';
			row.insertCell(flds.length + 2).innerHTML = '<button onclick="readmore(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">詳細資料</button>';

		})
		.catch(error => {
			console.error('發生錯誤:', error);
		});

}
function removeOrderDetail(button) {
	let orderDetailForm = button.parentNode.parentNode; // 获取订单详情表单
	orderDetailForm.parentNode.removeChild(orderDetailForm); // 删除订单详情表单
}