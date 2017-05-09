$(function(){
  function buildHTML(user){
    console.log(user);
    var html = $(`
      <div class="chat-group-user">
        <div class="chat-group-user__name">
          ${ user.name }
        </div>
      </div>
    `);

    return html;
  }

  $("#chat-group-form__search").on("keyup", function(e){
    e.preventDefault();
    var input = $.trim($("#chat-group-form__search").val());
    $.ajax({
      type: "GET",
      url: "/users/search",
      data: {
        keyword: input
      },
      dataType: "json"
    })
    .done(function(data){
      var displayResult = "";
      console.log(data);
      $.each(data, function(index, user){
        displayResult += buildHTML(user);
        console.log(user);
      });
      $("#search__user--result").html(displayResult);
    })
    .fail(function(data){
      alert("error");
    })
  });
});

