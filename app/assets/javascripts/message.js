$(function(){
  function buildHTML(message){
    var html = $(`
      <li class="content__main__chat__message">
        <span class="content__main__chat__message__name">
          ${ message.user.name }
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
      var html = buildHTML(data);
      $(".content__main__chat__message").append(html);
      $(".content__main__footer--message").val("");
    })
    .fail(function(){
      alert("Error");
    })
    .always(function(){
      $(".content__main__footer--send").prop("disabled", false);
    });
  });
});

