# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  $('a.comment-link').on 'click', (e) ->
    $(this).parent().append("<div class='comment-form' style='margin-top: 10px;'></div>")


  $('a.reply-link').on 'click', (e) ->
    $(this).parent().append("<div class='comment-form' style='margin-top: 10px;'></div>")

  $('.comments').hide()

  $('.hide-comments').on 'click', ->
    $(this).parent().siblings('.comments').toggle()

  $('.comment').on 'mouseover', ->
    $(this).css('background-color', '#F7F7F2')
  $('.comment').on 'mouseout', ->
    $(this).css('background-color', '#FFF')


$(document).ready(ready)
$(document).on('page:load', ready)
