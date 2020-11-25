
function show_result(data) {
    let result = document.getElementById("result");
    result.innerHTML = "<hr/>Result is: " + data.value + "<hr/>";
}

$(document).ready(function() {
    $("#number_form").on("ajax:success", function(event) {
        [data, status, xhr] = event.detail
        show_result(data)
    }).on("ajax:error", function(event) {
        $("#result").html("<p>Ошибка при AJAX-запросе</p>")
    })
})

