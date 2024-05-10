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
            $('#memberDropdown').show();
            $('#loginButton').hide();
        },
        error: function () {
            $('#memberDropdown').hide();
            $('#loginButton').show();
        }
    });



}
