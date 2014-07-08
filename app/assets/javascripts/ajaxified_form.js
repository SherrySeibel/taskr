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
});

