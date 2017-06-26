//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require freelancer

PUMP = {
    init:function () {
        PUMP.init_btn_switch();
        PUMP.btn_search();
    },

    init_btn_switch : function () {
        var type_search = $('#type_search');
        var list_btns = $('.sys-btn-category');
        var btn_old  = list_btns.eq(0);
        $(btn_old).attr('style', 'border-color:#4cae4c; background-color:#4cae4c;');
        for(var i = 0; list_btns.length > i; i++) {
            list_btns.eq(i).click(function () {
                $(type_search).attr('value', $(this).attr('value'));
                $(btn_old).attr('style', '');
                $(this).attr('style', 'border-color:#4cae4c; background-color:#4cae4c;');
                btn_old = $(this);
            });
        }
    },

    btn_search : function () {
        var type_search = $('#type_search');
        var srci = $('#search_input');
        $('#search_button').click(function () {
            PUMP.search({'query':$(srci).val()+'', 'type':$(type_search).val()},
            function (success) {
                PUMP.create_table_result(success, $(type_search).val());

            },
            function (error) {
                alert(error);
            });
        });
    },

    create_table_result: function (result, type_search) {
        var data = result.result;
        var column_names = result.column_name;
        var float_point= $('#result_data');
        $(float_point).children().remove();
        var tmp = "";
        var table = "<table class=\'table\'>";
        for (var i = 0; data.length > i; i++) {
            tmp = "";
            table +="<tr>";
            for(var j = 0; column_names.length > j; j++) {
                if (column_names[j] == 'id') {
                    tmp += PUMP.process_href(data[i][column_names[j]], type_search);
                } else {
                    if (column_names[j] != 'show') {
                        tmp += "<td>" + data[i][column_names[j]] + "</td>";
                    }
                }
            }
            table += tmp;
            table +="</tr>";
        }
        table += '</table>';
        $(float_point).prepend(table);
    },

    process_href : function (id, type_search) {
        var str = "<td><a href=";
        var href = "\'";
        if (type_search == 'pumps') {
            href += '/pumps/' + id;
        }
        if (type_search == 'pumps_category') {
            href += '/pumps_categories/' + id;
        }
        if (type_search == 'type_material') {
            href += '/type_materials/' + id;
        }
        str += href + "\'>Просмотреть</a></td>";
        return str;
    },

    search : function (data, success, error) {
        PUMP.post('/search', data, success, error);
    },

    //AJAX
    post: function(url, data, success, error) {
        $.ajax({
            url: url,
            type: 'POST',
            data: data,
            timeout: 30000,
            dataType: 'json',
            success: success,
            error: error
        });
    }
};

$(document).ready(function() {
    PUMP.init();
});

$(document).load(function() {
    PUMP.init();
});