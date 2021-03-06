# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.panel-heading span.clickable', (e) ->
	$this = $(this)
	if !$this.hasClass('panel-collapsed')
		$this.parents('.panel').find('.panel-body').slideUp()
		$this.addClass 'panel-collapsed'
		$this.find('i').removeClass('glyphicon-minus').addClass 'glyphicon-plus'
	else
		$this.parents('.panel').find('.panel-body').slideDown()
		$this.removeClass 'panel-collapsed'
		$this.find('i').removeClass('glyphicon-plus').addClass 'glyphicon-minus'
	return

$(document).on 'click', '.panel div.clickable', (e) ->
	$this = $(this)
	if !$this.hasClass('panel-collapsed')
		$this.parents('.panel').find('.panel-body').slideUp()
		$this.addClass 'panel-collapsed'
		$this.find('i').removeClass('glyphicon-minus').addClass 'glyphicon-plus'
	else
		$this.parents('.panel').find('.panel-body').slideDown()
		$this.removeClass 'panel-collapsed'
		$this.find('i').removeClass('glyphicon-plus').addClass 'glyphicon-minus'
	return

$(document).ready ->
	$('.panel-heading span.clickable').click()
	$('.panel div.clickable').click()
	return
