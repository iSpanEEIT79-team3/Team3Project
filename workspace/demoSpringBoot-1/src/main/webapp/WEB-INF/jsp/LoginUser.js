/**
 * 
 */
window.onload = function () {
    console.log("你到底有沒有近來");
    $('#memberDropdown').attr("style", "display: none");
    $('#loginButton').attr("style", "display: block");


    $.ajax({
        url: "/checkUserLogin",
        type: 'get',
        success: function () {
            console.log(222);
            $('#memberDropdown').show();
            $('#loginButton').hide();
        },
        error: function () {
            console.log(333);
            $('#memberDropdown').hide();
            $('#loginButton').show();
        }
    });



}
