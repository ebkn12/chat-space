$(function(){
  function sendMessage(message){
    var html = `
    <li class="content_main">
      <span class="content__main__chat__message__name">
        ${ message.user.name }
      </span>
      <span class= "content__main__chat__message__time">
        ${ message.updated_at.strftime("%Y/%m/%d %H:%M:%S") }
      </span>
      <div class="content__main__chat__message__text">
        ${ message.body }
      </div>
    </li>
    `;
    return html;
  }

  $(".form-js").on("submit", function(e){
    e.preventDefault();
    var textField = $(".content__main__footer--message");
    var body = textField.val();
    $.ajax({
      type: "POST",
      url: location.pathname,
      data: {
        message: {
          body: body
        }
      },
      dataType: "json"
    })
    .done(function(data){
      var html = sendMessage(data);
      $(".content__main__chat__message").append(html);
      $(".content__main__footer--message").val("");
      alert("成功");
    })
    .fail(function(){
      alert("Error");
    });
    .always(function(){
      $(".content__main__footer--send").prop("disabled", false);
    })
  });
});

