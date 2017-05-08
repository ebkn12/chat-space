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
});

