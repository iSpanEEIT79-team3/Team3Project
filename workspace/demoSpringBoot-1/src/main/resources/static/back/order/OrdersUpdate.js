/**
 * 
 */


function updateOrder(element,orderData) {
	let order = JSON.parse(orderData);
	 let row = element.closest('tr');
	 console.log(row);
	
	 let payStatus = row.cells[3].querySelector('select').value;
	let shippingStatus = row.cells[4].querySelector('select').value;
	let shippingDate = row.cells[5].querySelector('input').value;
	let payDeadline = row.cells[6].querySelector('input').value;
	let orderNote = row.cells[7].querySelector('input').value;


	// 创建包含表单数据的 JavaScript 对象
	let updateData = {
		"orderId": order.orderId,
		"userContactNew": { "contactId": order.userContactNew.contactId },
		"totalPrice": order.totalPrice,
		"payStatus": payStatus,
		"shippingStatus": shippingStatus,
		"orderDate": order.orderDate,
		"shippingDate": shippingDate,
		"payDeadline": payDeadline,
		"orderNote": orderNote
	};

	let updateJsonData = JSON.stringify(updateData);
	console.log("updateJsonData=" + updateJsonData);

	
	fetch(`http://localhost:8080/orders/${order.orderId}`, {
		method: 'PUT',
		headers: {
			'Content-Type': 'application/json',
		},
		body: updateJsonData
	});
}