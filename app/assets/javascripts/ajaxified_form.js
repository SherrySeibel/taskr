$(function() {
  $("#new_task_form").submit(function() {
    $.post(
      "/tasks",
      $("#new_task_form").serialize()
    );

    return false;
  })
});

