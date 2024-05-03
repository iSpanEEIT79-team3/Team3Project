/**
 * 
 */



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
        <label for="productNum">Product Num:</label>
        <input type="text" class="productNum" name="productNum">
        
        <label for="productName">Product Name:</label>
        <input type="text" class="productName" name="productName">
        
        <label for="productPrice">Product Price:</label>
        <input type="text" class="productPrice" name="productPrice">
        
        <label for="productQuantity">Product Quantity:</label>
        <input type="text" class="productQuantity" name="productQuantity">
        
        <label for="orderTotalPrice">Order Total Price:</label>
        <input type="text" class="orderTotalPrice" name="orderTotalPrice">
         <button type="button" onclick="removeOrderDetail(this)">刪除</button>
    `;
    orderDetailForm.appendChild(orderDetailDiv);

    parentForm.insertBefore(orderDetailForm, submitButton); // 插入到提交按钮之前
}

// 提交表单
function submitForm(event) {
    event.preventDefault(); 

    let formData = [];
    let orderDetailForms = document.querySelectorAll('.orderDetailForm'); // 选择所有订单详情表单
    orderDetailForms.forEach(form => {
        let formDataItem = {};
        let inputs = form.querySelectorAll('input'); // 选择当前表单中的所有输入框
        inputs.forEach(input => {
            formDataItem[input.name] = input.value;
        });
        formData.push(formDataItem); // 将当前订单详情的数据添加到 formData 数组中
    });
    let orderNote = orderNoteInput.value;
    let idUsers = idUsersInput.value;
    let data = {
    "userContactNew": {"contactId": idUsers},
	"orderNote":orderNote,	
    "orderDetails": formData
};
    let json = JSON.stringify(data);
    console.log(json);
    
    fetch('http://localhost:8080/PayTest', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
		
		body: json
	});

 
}
function removeOrderDetail(button) {
    let orderDetailForm = button.parentNode.parentNode; // 获取订单详情表单
    orderDetailForm.parentNode.removeChild(orderDetailForm); // 删除订单详情表单
}