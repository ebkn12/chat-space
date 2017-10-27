$(function(){
  function searchUsers(user){
    var html = "<div class='chat-group-user add-user'><div class='chat-group-user__name'>" +
    user.name +
    "</div><a class='chat-group-user__btn chat-group-user__btn--add' data-user_id='" + user.id + "' data-user_name='" + user.name + "'>追加</a></div>";

    return html;
  }

  function addUser(user_id, user_name) {
    var html = "<div class='chat-group-user remove-user'><p class='chat-group-user__name'>" +
    user_name +
    "</p><a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove' data-user_id='" + user_id + "'>削除</a><input type='hidden' name='group[user_ids][]' value='" + user_id + "'></div>";

    return html;
  }

  var preInput = "";
  $("#chat-group-form__search").on("keyup", function(){
    var input = $.trim($("#chat-group-form__search").val());
    if (preInput != input){
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
        $.each(data, function(index, user){
          displayResult += searchUsers(user);
        });
        $("#search__user--result").html(displayResult);
      })
      .fail(function(data){
        alert("error");
      });
    }
    preInput = input;
    return false;
  });

  $(document).on("click", ".chat-group-user__btn--add", function(){
    var user_id = $(this).data("user_id");
    var user_name = $(this).data("user_name");
    $(this).parent().remove();
    var addUserHTML = addUser(user_id, user_name);
    $("#search__user--result").append(addUserHTML);
  });

  $(document).on("click", ".chat-group-user__btn--remove", function(){
    $(this).parent().remove();
  });
});
