/**
 * 
 */
function readmore(order) {
	let json = JSON.stringify(order);
    console.log("json"+json);
    let div = document.getElementById("readMoreDiv");
    if (div) {
        div.remove();
    } else {
		
        let newDiv = document.createElement("div");
        newDiv.setAttribute("id", "readMoreDiv");
        document.body.appendChild(newDiv);       
        order.orderDetails.forEach(function(detail) {
            newDiv.append(displayJsonAsForm(detail));
        });
    }
}





function jsonToForm(json) {
	let formHtml = '<form>';

	for (let key in json) {
		formHtml += `
            <div>
                <label for="${key}">${key}:</label>
                <input type="text" readonly id="${key}" name="${key}" value="${json[key]}">
            </div> 
        `;
	}
	

	formHtml += '<hr></form>';

	return formHtml;
}

function displayJsonAsForm(json) {
	
	let formHtml = jsonToForm(json);

	
	let ReadMoreFormContainer = document.createElement('div');
	ReadMoreFormContainer.setAttribute("id", "ReadMoreFormContainer");
	ReadMoreFormContainer.innerHTML = formHtml;
	
	return ReadMoreFormContainer;
}
