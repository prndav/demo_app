# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  $('a.comment-link').on 'click', (e) ->
    $(this).parent().append("<div class='comment-form' style='margin-top: 10px;'></div>")

  $('a.reply-link').on 'click', (e) ->
    $(this).parent().append("<div class='reply-form' style='margin-top: 10px;'></div>")


$(document).ready(ready)
$(document).on('page:load', ready)
