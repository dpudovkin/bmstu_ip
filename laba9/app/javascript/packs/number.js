
function show_result(data) {
    let result = document.getElementById("result");
    if (data.type == "Array") {
        let text = "<table border=\"1\">   <caption>Результат</caption>";
        data.value.forEach(function (item, i, arr) {
            text += "<tr>" + "<td>" + item[0] + "</td>" + "<td>" + item[1] + "</td>" + "</tr>"
        });
        text += "</tabel>"
        result.innerHTML = text;
    } else {
        if (data.value==-1){
            result.innerHTML = "Некорректные данные";
        } else{
            result.innerHTML = "Дружественных чисел нет";
        }
    }

}

window.addEventListener("load", () => {
    const element = document.querySelector("#number_form");
    element.addEventListener("ajax:success", (event) => {
        [data, status, xhr] = event.detail;
        show_result(data)
    });
    element.addEventListener("ajax:error", () => {
        $("#result").html("<p>Ошибка при AJAX-запросе</p>")
    });
});
