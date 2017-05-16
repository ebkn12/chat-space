$(function(){
  function buildHTML(message){
    var html;
    if (message.image){
      html = `
        <li class="content__main__chat__message" data-id="${ message.id }">
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
      html = `
        <li class="content__main__chat__message" data-id="${ message.id }">
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
    $("body").prepend(flash);
  }

  function errorFlash(){
    var flash = `
      <div class="alert">
        メッセージの送信に失敗しました
      </div>
    `;
    $("body").prepend(flash);
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
      contentType: false
    })
    .done(function(data){
      if($.type(data) === "object"){
        successFlash();
        var html = buildHTML(data);
        $(".content__main__chat").append(html);
        $(".content__main__footer--message").val("");
        textField.empty();
        $("#message_image").val("");
        autoScroll();
      } else {
        errorFlash();
      }
    })
    .fail(function(data){
      errorFlash();
    })
    .always(function(){
      setTimeout(function(){
        $(".notice").remove();
        $(".alert").remove();
      },1000);
    });
    return false;
  });

  setInterval(function(){
    var path = location.pathname.split("/");
    if(path[3]+path[4] === "messagesnew"){
      reload_messages();
    };
  }, 3000);

  function reload_messages(){
    var last_message_id = $(".content__main__chat__message").last().data("id");
    $.ajax({
      type: "GET",
      url: "./new",
      data: {
        last_message_id: last_message_id
      },
      dataType: "json"
    })
    .done(function(data){
      if(data.length > 0){
        $.each(data, function(index, message){
          var html = buildHTML(message);
          $(".content__main__chat").append(html);
        });
        autoScroll();
      }
    })
    .fail(function(){
      alert("データの更新に失敗しました");
    });
  };
});

