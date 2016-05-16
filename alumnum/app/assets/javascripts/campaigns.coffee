# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$(document).ready ->
#	jQuery ->
#		@map = null
#
#		new googleMap()
#
#		class googleMap
#			window.initMap = ->
#				@map = new (google.maps.Map)(document.getElementById('marker-map'))



#paintIt = (element, backgroundColor, textColor) ->
#  element.style.backgroundColor = backgroundColor
#  if textColor?
#    element.style.color = textColor
 
#$ ->
#  $("a[data-background-color]").click (e) ->
#    e.preventDefault()
# 
#    backgroundColor = $(this).data("background-color")
#    textColor = $(this).data("text-color")
#    paintIt(this, backgroundColor, textColor)

#  $("#new_article").on("ajax:success", (e, data, status, xhr) ->
#    $("#new_article").append xhr.responseText
#  ).on "ajax:error", (e, xhr, status, error) ->
#    $("#new_article").append "<p>ERROR</p>"

#$ ->
#	map = null
#	infowindow = null
#	request = null
#	marker = null

#initMap = ()->
#	mapOptions =  
#		center: new google.maps.LatLong(lat: -34.397, lng: 150.644)
#		zoom: 8
       		
#   	map = new google.maps.Map(document.getElementById("marker-map"), mapOptions)

#initMap()
#marker

#createMarker(coords, map, title) ->
#	marker = new google.maps.Marker({
#		position: coords,
#		map: map,
#		title: title
#		})


