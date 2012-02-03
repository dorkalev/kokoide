# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.ugly_escape = (x) ->
  escape(x.replace(/\./gi,"DOTDOT").replace(/\//gi,'SLASHSLASH'))
  
window.open_file = (x) ->
  location.hash = "##{x}"
  window.current_file = x
  $.ajax
    url: "/philes/#{ugly_escape(x)}.json"
    type: 'get'
    dataType: 'json'
    context: document.body
    success: (msg) =>
      editor.setValue msg.content

window.save_file = ->
  $.ajax
    url: "/philes/#{ugly_escape(current_file)}.json"
    type: 'put'
    data: $.param({content: editor.getValue()})
    dataType: 'json'
    context: document.body
    success: (msg) =>
      console.log msg
    error: (msg) =>
      console.log msg

$(window).load ->
  $('.save_button').click ->
    do window.save_file
