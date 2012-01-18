
var home_scripts = {
    search_click: function () {
        var criteria = home_scripts.get_search_criteria();
        $.ajax({
            url: "SearchHandler.ashx",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data: criteria,
            success: home_scripts.display_search_results,
            error: home_scripts.handle_search_error
        });
        //        var output = "";
        //        for (property in criteria) {
        //            output += property + ": " + criteria[property] + "\n";
        //        }
        //        document.getElementById("test").innerHTML = output;
        return false;
    },

    get_search_criteria: function () {
        return {
            keyword: $("#keyword").val(),
            university: $("#university").val(),
            type_id_varchar: $("#category").val().toString(),
            date: $("#date").val().toString()
        }
    },

    display_search_results: function (data, textStatus, jqXHR) {
        //        alert(data[0].Name + ", " + data[1].Name + ", " + data[2].Name);
        //        var date = data[0].Date;
        //        var parsed_date = new Date(parseInt(date.replace("/Date(", "").replace(")/", ""), 10));
        //        alert(parsed_date.toString());
//        var ids = [];
//        var i;
//        for (i = 0; i < data.length; i += 1) {
//            ids.push("#" + data[i].Id);
//        }
        $("#events_table").children().has("td").filter("#" + data.join(", #")).show();
        $("#events_table").children().has("td").not("#" + data.join(", #")).hide();
        //$("#events_table").children().hide();
    },

    handle_search_error: function (result) {
        alert("search failed");
    }


}
