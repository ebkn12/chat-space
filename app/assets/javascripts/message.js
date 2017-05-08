$(function(){
  function buildHTML(message){
    var html = $(`
      <li class="content__main__chat__message">
        <span class="content__main__chat__message__name">
          ${ message.name }
        </span>
        <span class= "content__main__chat__message__time">
          ${ message.updated_at }
        </span>
        <div class="content__main__chat__message__text">
          ${ message.body }
        </div>
      </li>
    `);

    return html;
  }

  function error_flash(data) {
    var error_flash = $(`
      <div class="alert">
        "メッセージの送信に失敗しました"
      </div>
    `);
    return error_flash
    }

  $("#new_message").on("submit", function(e){
    $(".alert").remove();
    e.preventDefault();
    var textField = $(".content__main__footer--message");
    var input = textField.val();
    var path = location.pathname;
    $.ajax({
      type: "POST",
      url: path,
      data: {
        message: {
          body: input
        }
      },
      dataType: "json"
    })
    .done(function(data){
      var html = buildHTML(data);
      $(".content__main__chat").append(html);
      $(".content__main__footer--message").val("");
      console.log(data);
    })
    .fail(function(data){
      var html = error_flash(data);
      $("body").prepend(html);
    })
    .always(function(){
      $(".content__main__footer--send").prop("disabled", false);
    });
  });
});

