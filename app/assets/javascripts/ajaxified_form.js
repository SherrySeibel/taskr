$(function(){
  $("#new_task_form").submit(function(){
    $.post(
      "/tasks",
      $("#new_task_form").serialize()
      ).done(function(html){
        $("#tasks").prepend(html);
        $("#errors").html("");
        $("#task_title, #task_body").val("");
      }).fail(function(xhr){
        var html = xhr.responseText;
        $("#errors").html(html);
      });

    return false;
  })

  $("#tasks").on("click", ".completed_checkbox", function(event){
    var formEl = $(event.target).parents("form");
    $.ajax({
      url: formEl.prop("action"),
      data: formEl.serialize(),
      type: "PATCH"
    }).done(function(){
      formEl.parents("li").fadeOut();
    });
  });

  $("#tasks").on("click", "#delete", function(event){
    var spanEl = $(event.target).parents("form");
    $("div").click(function(){
      $(".kill").toggle();
    });
  });
});

