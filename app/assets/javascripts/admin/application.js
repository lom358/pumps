//= require jquery
//= require jquery_ujs
//= require_tree .

//Без особой заморочки постраничного разграничения срабатывания скрипта
ADMIN = {

    init:function () {
        ADMIN.init_btn();
    },

    init_btn : function () {
        $('#download_csv').click(function () {
            alert('download_csv');
        });

        $('#download_exl').click(function () {
            alert('download_exl ');
        });
    },

    //AJAX 
    post: function(data, success, error) {
        $.ajax({
            url: '/send_form',
            type: 'POST',
            data: data,
            timeout: 30000,
            dataType: 'json',
            success: success,
            error: error
        })


    }

};

$(document).ready(function() {
    ADMIN.init();
});