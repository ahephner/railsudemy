# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.

ready = undefined

ready = -> 
  $('.sortable').sortable()
  return

$(document).ready ready
