
function addOrderDetail() {



	let orderDetailDiv = document.createElement('div');
	orderDetailDiv.className = 'orderDetail';
	orderDetailDiv.innerHTML = `
        <label>訂單明細:</label>
        <input type="text" name="productNum" placeholder="產品編號">
        <input type="text" name="productName" placeholder="產品名稱">
        <input type="text" name="productPrice" placeholder="商品價格">
        <input type="text" name="productQuantity" placeholder="商品數量">
        <input type="text" name="orderTotalPrice" placeholder="商品總價">
        <button type="button" class="btn btn-danger" onclick="removeOrderDetail(this)">刪除</button>
        <br>
    `;

	let orderDetailFieldset = document.getElementById('orderDetail');
	orderDetailFieldset.appendChild(orderDetailDiv);




	// 選擇所有的 input 元素
	//let inputs = document.querySelectorAll('input');

	// 遍歷所有的 input 元素，為它們添加指定的類
	//inputs.forEach(input => {
	//input.classList.add('form-control-sm');
	//});
}
// 提交表单
function submitForm(event) {
	event.preventDefault();

	let form = document.getElementById("OrderNewForm");

	// 获取输入元素的值
	let idUsers = form.querySelector('input[name="idUsers"]');
	let orderNote = form.querySelector('textarea[name="orderNote"]');

	// 在控制台中打印获取到的值
	console.log("會員編號:", idUsers.value);
	console.log("備註:", orderNote.value);

	console.log("111111111111111111111111111111111111111111");

	let formData = [];
	document.querySelectorAll('.orderDetail').forEach(form => {
		let formDataItem = {};
		form.querySelectorAll('input').forEach(input => {
			formDataItem[input.name] = input.value;
		});
		formData.push(formDataItem);
	});
	console.log(formData);
	let data = {
		"userContactNew": { "contactId": idUsers.value },
		"orderNote": orderNote.value,
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



			idUsers.value = "";
			orderNote.value = "";
			let fieldset = document.getElementById("orderDetail");
			console.log(22222222222);
			fieldset.innerHTML = '';
			console.log(3333333333333333);

			let table = $('#sampleTable').DataTable();
			//let flds = [order.orderId, order.userContactNew.contactId, order.totalPrice, order.payStatus, order.shippingStatus, order.orderDate, order.shippingDate, order.payDeadline, order.orderNote];

			// 添加新行的数据
		let rowData = [
    order.orderId,
    order.userContactNew.contactId,
    order.orderDate,
    `<select>
        <option value="未付款" ${order.payStatus === '未付款' ? 'selected' : ''}>未付款</option>
        <option value="已付款" ${order.payStatus === '已付款' ? 'selected' : ''}>已付款</option>
    </select>`,
    `<select>
        <option value="未出貨" ${order.shippingStatus === '未出貨' ? 'selected' : ''}>未出貨</option>
        <option value="已出貨" ${order.shippingStatus === '已出貨' ? 'selected' : ''}>已出貨</option>
        <option value="不須出貨" ${order.shippingStatus === '不須出貨' ? 'selected' : ''}>不須出貨</option>
    </select>`,
    order.shippingDate,
    order.payDeadline,
    order.orderNote,
    '<button class="btn btn-primary" onclick="updateOrder(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">更改</button>',
    '<button class="btn btn-primary" onclick="deleteOrder(' + order.orderId + ')">刪除</button>',
    '<button class="btn btn-primary" onclick="readmore(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">詳細資料</button>'
];

			// 使用 DataTable API 添加新行
			table.row.add(rowData).draw(false);



/*
			for (let i = 0; i < flds.length; i++) {
				row.insertCell(i).innerHTML = flds[i];
				console.log(5);
			}
			console.log(6);
			row.insertCell(flds.length).innerHTML = '<button onclick="updateOrder(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">更改</button>';
			row.insertCell(flds.length + 1).innerHTML = '<button onclick="deleteOrder(' + order.orderId + ')">刪除</button>';
			row.insertCell(flds.length + 2).innerHTML = '<button onclick="readmore(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">詳細資料</button>';
			console.log(7);
			//$('#sampleTable').DataTable(); 
			console.log(8);*/

		})
		.catch(error => {
			console.error('發生錯誤:', error);
		});


}
function removeOrderDetail(button) {
	let orderDetailDiv = button.parentNode; //找到訂單詳情的div 
	orderDetailDiv.parentNode.removeChild(orderDetailDiv);
}