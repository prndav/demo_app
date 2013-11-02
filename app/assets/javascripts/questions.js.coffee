# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  $('a.comment-link').on 'click', (e) ->
    $('.comment-form').each ->
      $(this).remove()
    $('.disabled').removeClass('disabled').addClass('comment-link')
    $(this).parent().append("<div class='comment-form'></div>")
    $(this).removeClass('comment-link').addClass('disabled')


  # show/hide comments
  $('.hide-comments').on 'click', ->
    $(this).siblings('.comments').slideToggle()
    $(this).children('i').toggleClass('icon-chevron-right icon-chevron-down')


  # comment background
  $('.comment').on 'mouseover', ->
    $(this).addClass('highlight')
  $('.comment').on 'mouseout', ->
    $(this).removeClass('highlight')



$(document).ready(ready)
$(document).on('page:load', ready)
