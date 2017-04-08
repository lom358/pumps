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
            var category_id = $('#pump_category_id').val();
            ADMIN.download_csv(category_id);
        });

        $('#download_exl').click(function () {
            var category_id = $('#pump_category_id').val();
            ADMIN.download_exl(category_id);
        });
    },

    download_csv : function (category_id) {
      ADMIN.post('download_csv', {'pumps_category_id':category_id},
      function (success) {
          window.location.href = '/' + success.path;
      },
      function (error) {
          alert('Произошла ошибка. Обратитесь к администратору');
      });
    },

    download_exl : function (category_id) {
      ADMIN.post('download_exl', {'pumps_category_id':category_id},
      function (success) {
          window.location.href = '/' + success.path;
      },
      function (error) {
        alert('Произошла ошибка. Обратитесь к администратору');
      });
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
    ADMIN.init();
});