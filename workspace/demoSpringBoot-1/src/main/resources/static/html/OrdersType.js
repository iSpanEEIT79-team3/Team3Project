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
	'<th>訂單詳情</th>'+
	'<th>綠界付款</th>'+
	'<th>LinePay付款</th>';
table.appendChild(thead);

// 創建表格主體
let tbody = document.createElement('tbody');
tbody.setAttribute('id', 'orderTableBody');
table.appendChild(tbody);

// 將表格添加到 main 中
document.querySelector('.main').appendChild(table);

//document.body.appendChild(table);

fetch("/OrdersList", {
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
			let row = document.getElementById("orderTableBody").insertRow();
			//let row = tbody.insertRow();
			row.insertCell(0).innerHTML = order.orderId;
			row.insertCell(1).innerHTML = order.userContactNew.contactId;
			row.insertCell(2).innerHTML = order.totalPrice;
			row.insertCell(3).innerHTML = order.payStatus;
			row.insertCell(4).innerHTML = order.shippingStatus;
			row.insertCell(5).innerHTML = order.orderDate;
			row.insertCell(6).innerHTML = order.shippingDate;
			row.insertCell(7).innerHTML = order.payDeadline;
			row.insertCell(8).innerHTML = order.orderNote;			
			row.insertCell(9).innerHTML = '<button onclick="readmore(' + JSON.stringify(order).replace(/"/g, '&quot;') + ')">詳細資料</button>';
			row.insertCell(10).innerHTML = '<button onclick="PayNow(' + order.orderId + ')">綠界付款</button>';
			row.insertCell(11).innerHTML = '<button onclick="LinePayNow(' + order.orderId + ')">LinePay</button>';
		});
	})

	.catch(function(error) {
		console.error('Error fetching data:', error);
	});



function PayNow(orderId) {
    // 构建支付页面的URL，替换orderId为实际订单ID
    let paymentUrl = `http://localhost:8080/PayTest/${orderId}`;
    // 跳转到支付页面
    window.location.href = paymentUrl;
}

function LinePayNow(orderId) {
    let paymentUrl = `http://localhost:8080/LinePayTest/${orderId}`;

    fetch(paymentUrl, {
        method: "POST" 
    })
    .then(response => {
        return response.text();
    })
   .then(url => {
	console.log(url);
    window.location.href = url;
    })
}




