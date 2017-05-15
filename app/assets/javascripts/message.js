$(function(){
  function buildHTML(message){
    if (message.image){
      var html = `
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
          <div class="content__main__chat__image">
            <image src=${ message.image }></image>
          </div>
        </li>
      `;
    } else {
      var html = `
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
      `;
    }

    return html;
  }

  function successFlash(){
    var flash = `
      <div class="notice">
        メッセージの送信に成功しました
      </div>
    `;

    return flash;
  }

  function errorFlash(){
    var flash = `
      <div class="alert">
        メッセージの送信に失敗しました
      </div>
    `;

    return flash;
  }

  function autoScroll() {
    $('.content__main__chat').animate( {
      scrollTop: $(document).height()
    }, 1000);
  }

  $(".content__main__footer--picture").on("change", function(){
    $("#new_message").submit();
  });

  $("#new_message").on("submit", function(e){
    e.preventDefault();
    var textField = $(".content__main__footer--message");
    var input = textField.val();
    var form_data = new FormData($(this).get(0));
    $.ajax({
      type: "POST",
      url: "./",
      data: form_data,
      dataType: "json",
      processData: false,
      contentType: false,
      cotext: this,
    })
    .done(function(data){
      var flash = successFlash();
      $("body").prepend(flash);
      var html = buildHTML(data);
      $(".content__main__chat").append(html);
      $(".content__main__footer--message").val("");
      autoScroll();
    })
    .fail(function(data){
      var flash = errorFlash();
      $("body").prepend(flash);
    })
    .always(function(){
      setTimeout(function(){
        $(".notice").remove();
        $(".alert").remove();
      },1000);
    });
    return false;
  });
});

