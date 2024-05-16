/**
 * 
 */
/**
 * 
 */
let table = document.getElementById("sampleTable");
//let table = document.createElement('table');
table.setAttribute('border', '1');
//table.setAttribute('id', 'orderTable');

// 創建表頭
let thead = document.createElement('thead');
thead.style.backgroundColor = '#EEBA7E';
let headerRow = thead.insertRow();
headerRow.innerHTML = '<th>訂單編號</th>' +
	'<th>會員編號</th>' +
	
	'<th>訂單日期</th>' +
	'<th>付款狀態</th>' +
	'<th>出貨狀態</th>' +
	'<th>出貨日期</th>' +
	'<th>結帳截止日</th>' +
	'<th>備註</th>' +
	'<th>修改</th>' +
	'<th>刪除</th>' +
	'<th>詳細資料</th>';
table.appendChild(thead);

// 創建表格主體
let tbody = document.createElement("tbody");
//tbody.setAttribute('id', 'orderTableBody');
table.appendChild(tbody);

// 將表格添加到 body 中
//document.body.appendChild(table);
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
			 let flds = [order.orderId, order.userContactNew.contactId, order.orderDate];
			//let flds = [order.orderId, order.userContactNew.contactId, order.totalPrice, order.orderDate, order.payStatus, order.shippingStatus, order.shippingDate, order.payDeadline, order.orderNote];
			for (let i = 0; i < flds.length; i++) {
				row.insertCell(i).innerHTML = flds[i];

			}
			 let payStatusCell = row.insertCell(3);
                let shippingStatusCell = row.insertCell(4);
                let shippingDateCell = row.insertCell(5);
                let payDeadlineCell = row.insertCell(6);
                let orderNoteCell = row.insertCell(7);

                payStatusCell.innerHTML = `
                    <select>
                        <option value="未付款" ${order.payStatus === '未付款' ? 'selected' : ''}>未付款</option>
                        <option value="已付款" ${order.payStatus === '已付款' ? 'selected' : ''}>已付款</option>
                    </select>`;

                shippingStatusCell.innerHTML = `
                    <select>
                        <option value="未出貨" ${order.shippingStatus === '未出貨' ? 'selected' : ''}>未出貨</option>
                        <option value="已出貨" ${order.shippingStatus === '已出貨' ? 'selected' : ''}>已出貨</option>
                        <option value="不須出貨" ${order.shippingStatus === '不須出貨' ? 'selected' : ''}>不須出貨</option>
                    </select>`;

                shippingDateCell.innerHTML = `<input type="date" value="${order.shippingDate}">`;
                payDeadlineCell.innerHTML = `<input type="date" value="${order.payDeadline}">`;
                orderNoteCell.innerHTML = `<input type="text" value="${order.orderNote}">`;

			// 插入內容
			row.insertCell(8).innerHTML = '<button class="btn btn-primary" onclick="updateOrder(this, \'' + JSON.stringify(order).replace(/"/g, '&quot;') + '\')">更改</button>';
			//row.insertCell(8).innerHTML = '<button class="btn btn-primary" onclick="updateOrder('+ JSON.stringify(order).replace(/"/g, '&quot;') + ')">更改</button>';
			row.insertCell(9).innerHTML = '<button class="btn btn-primary" onclick="deleteOrder(' + order.orderId + ')">刪除</button>';		
			row.insertCell(10).innerHTML = '<button class="btn btn-primary" onclick="readmore(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">詳細資料</button>';
		});
		   fetch('../exampleBack.html')
    .then(response => response.text())
    .then(html => {
        document.body.innerHTML += html;
        $('#sampleTable').DataTable(); 
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




