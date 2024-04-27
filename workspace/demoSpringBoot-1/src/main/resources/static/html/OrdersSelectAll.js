/**
 * 
 */
/**
 * 
 */

let table = document.createElement('table');
table.setAttribute('border', '1');
table.setAttribute('id', 'orderTable');

// 創建表頭
let thead = document.createElement('thead');
thead.style.backgroundColor = '#a8fefa';
let headerRow = thead.insertRow();
headerRow.innerHTML = '<th>訂單編號</th>' +
	'<th>會員編號</th>' +
	'<th>總金額</th>' +
	'<th>付款狀態</th>' +
	'<th>出貨狀態</th>' +
	'<th>訂單日期</th>' +
	'<th>出貨日期</th>' +
	'<th>結帳截止日</th>' +
	'<th>備註</th>' +
	'<th>修改</th>' +
	'<th>刪除</th>' +
	'<th>詳細資料</th>';
table.appendChild(thead);

// 創建表格主體
let tbody = document.createElement('tbody');
tbody.setAttribute('id', 'orderTableBody');
table.appendChild(tbody);

// 將表格添加到 body 中
document.body.appendChild(table);
// 使用fetch從Servlet取得JSON數據
fetch("/orders", {
	method: "GET", headers: {
		'Content-Type': 'application/json', 'Cache-Control': 'no-cache'
	},
})
	.then(function(response) {

		return response.json();
	})
	.then(function(data) {
		// 創建表格元素

		// 遍歷數據and創立表格
		data.forEach(function(order) {
			console.log(order);
			let row = tbody.insertRow();
			/*let data = {};
			let flds = ['orderId', 'userContact.idUser', 'totalPrice', ...];
			for (let fld of flds) {
				row.insertCell(index).innerHTML = order....;
			}*/
			data[0] = order.orderId;
			// 插入內容
			row.insertCell(0).innerHTML = order.orderId;
			row.insertCell(1).innerHTML = order.userContactNew.contactId;
			row.insertCell(2).innerHTML = order.totalPrice;
			row.insertCell(3).innerHTML = order.payStatus;
			row.insertCell(4).innerHTML = order.shippingStatus;
			row.insertCell(5).innerHTML = order.orderDate;
			row.insertCell(6).innerHTML = order.shippingDate;
			row.insertCell(7).innerHTML = order.payDeadline;
			row.insertCell(8).innerHTML = order.orderNote;


			row.insertCell(9).innerHTML = '<button onclick="updateOrder(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">更改</button>';
			//row.insertCell(9).innerHTML = `<button onclick="updateOrder(${JSON.stringify(order)})">更改</button>`;
			//row.insertCell(9).innerHTML = '<button onclick="updateOrder('+this.order+')">更改</button>';
			//row.insertCell(9).innerHTML = '<button onclick="updateOrder(' + JSON.stringify(order) + ')">更改</button>';
			row.insertCell(10).innerHTML = '<button onclick="deleteOrder(' + order.orderId + ')">刪除</button>';
			/*row.insertCell(11).innerHTML = '<button onclick="readmore( ' + JSON.stringify(order.orderDetails).replace(/"/g, '&quot;')+ +')
			+ 'JSON.stringify(order.User).replace(/"/g, '&quot;')
			+ '})">詳細資料</button>';*/
			row.insertCell(11).innerHTML = '<button onclick="readmore(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">詳細資料</button>';
		});
	})

	.catch(function(error) {
		console.error('Error fetching data:', error);
	});


function deleteOrder(orderId) {

	fetch(`http://localhost:8080/orders/${orderId}`, {
		method: 'delete'
	})
	//window.location.href = "http://localhost:8080/project3/OrderIndex.html";
	location.reload();
}




