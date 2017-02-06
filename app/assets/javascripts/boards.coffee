# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


viewerNum = 0

@newViewer = ->
	$('#viewlist').append('<input type="text" name="board[viewlist][' + viewerNum++ + ']"><br>')
	return
