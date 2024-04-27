/**
 * 
 */
function updateOrder(order) {
	console.log(order);
	// 检查是否已存在表单，如果存在则先移除旧表单
	let updateForm= document.getElementById("updateForm");

	if (updateForm) {
		if (updateForm.style.display === 'none') {
			updateForm.style.display = 'block';
		} else {
			updateForm.style.display = 'none';
		}
	} else {





		let updateForm = document.createElement("form");
		updateForm.id = "updateForm";

		// 将表单元素添加到 DOM 中
		document.body.appendChild(updateForm);

		let formContent = `
        <label for="updatepayStatus">付款狀態:</label>
        <select id="updatepayStatus" name="payStatus">
            <option value="未付款">未付款</option>
            <option value="已付款">已付款</option>
        </select><br>
        
        <label for="updateshippingStatus">出貨狀態:</label>
        <select id="updateshippingStatus" name="shippingStatus">
            <option value="未出貨">未出貨</option>
            <option value="已出貨">已出貨</option>
            <option value="不須出貨">不須出貨</option>
        </select><br>
        
        <label for="updateshippingDate">出貨日期:</label>
        <input type="date" id="updateshippingDate" name="shippingDate" value="${order.shippingDate}"><br>
        
        <label for="updatepayDeadline">付款截止日期:</label>
        <input type="date" id="updatepayDeadline" name="payDeadline" value="${order.payDeadline}"><br>
        
        <label for="updateorderNote">備註:</label>
        <input type="text" id="updateorderNote" name="orderNote" value="${order.orderNote}"><br>
        
        <input type="submit" value="確認更新">
    `;

		// 设置表单内容
		updateForm.innerHTML = formContent;

		updateForm.addEventListener('submit', function(event) {
			event.preventDefault();

			// 获取表单元素的值
			let payStatus = updateForm.elements["payStatus"].value;
			let shippingStatus = updateForm.elements["shippingStatus"].value;
			let shippingDate = updateForm.elements["shippingDate"].value;
			let payDeadline = updateForm.elements["payDeadline"].value;
			let orderNote = updateForm.elements["orderNote"].value;

			// 创建包含表单数据的 JavaScript 对象
			let updateData = {
				"orderId": order.orderId,
				"userContactNew":			
				  {"contactId": order.userContactNew.contactId},
				 
				"totalPrice": order.totalPrice,
				"payStatus": payStatus,
				"shippingStatus": shippingStatus,
				"orderDate": order.orderDate,
				"shippingDate": shippingDate,
				"payDeadline": payDeadline,
				"orderNote": orderNote
			};

			let updateJsonData = JSON.stringify(updateData);
			console.log("updateJsonData", updateJsonData);

			// 发送更新请求
			fetch(`http://localhost:8080/orders/${order.orderId}`, {
				method: 'PUT',
				headers: {
					'Content-Type': 'application/json',
				},
				body: updateJsonData
			});
		});
	}
}
