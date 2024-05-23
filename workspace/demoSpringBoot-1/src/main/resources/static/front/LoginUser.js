/**
 * 
 */
window.onload = function () {
    $('#memberDropdown').attr("style", "display: none");
    $('#loginButton').attr("style", "display: block");


    $.ajax({
        url: "/checkUserLogin",
        type: 'get',
        success: function () {
			console.log("成功");
            $('#memberDropdown').show();
            $('#loginButton').hide();
        },
        error: function () {
			console.log("失敗");
            $('#memberDropdown').hide();
            $('#loginButton').show();
        }
    });



}
