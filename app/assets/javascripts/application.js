//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require freelancer
//= require_directory .
// require_tree .

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
                alert(success);
            },
            function (error) {
                alert(error);
            });
            alert($(srci).val()  + " " + $(type_search).val());
        });
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