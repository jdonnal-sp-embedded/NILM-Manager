# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ = jQuery
$ ->
  $('#new-plot').click(addPlotPane)
  setupUI()
  $('.delete-plot').click(deletePlotPane)
  $('.create-plot').click(requestPlot)

setupUI = ->
   $('#tabs').tabs()
   $('.date').datepicker({defaultDate: null})
   $('.plot').addClass('ui-widget ui-widget-content ui-corner-all')
   $('.plot-header').addClass('ui-widget-header ui-dialog-titlebar ui-corner-all ui-helper-reset ui-helper-clearfix')
   $('.delete-plot').addClass('close-button')
   $(".delete-plot").button({icons: {primary:'ui-icon-closethick'}, text:false})
   $(".create-plot").button({icons: {primary: 'ui-icon-check'}, label: "Create"})
   $("#new-plot").button({icons: {secondary: 'ui-icon-circle-plus'}, label: 'Add A Plot'})

nextPlotPaneID=2

addPlotPane = ->
  $("#new-plot").button("option","disabled",true);
  $.get 'plots/new', (data)-> insertPlotPane(data)

insertPlotPane = (data)->
  $("#plots").append('<div id=\'p'+nextPlotPaneID+'\' class=\'plot\'/>')
  $('#p'+nextPlotPaneID).html(data).hide()
  $('#p'+nextPlotPaneID+'>.plot-header>.delete-plot').click(deletePlotPane)
  $('#p'+nextPlotPaneID+'>.new-plot>.create-plot').click(requestPlot)
  setupUI()
  $('#p'+nextPlotPaneID).slideDown()
  nextPlotPaneID=nextPlotPaneID+1
  $("#new-plot").button("option","disabled",false);
  
deletePlotPane  = (event)->
  event = event || window.event
  src = event.target || event.srcElement;
  paneID=src.parentNode.parentNode.getAttribute('id')
  $('#'+paneID).slideUp()

requestPlot = (event) ->
  event = event || window.event
  src = event.target || event.srcElement;
  paneID=src.parentNode.parentNode.getAttribute('id')
  date=$('#'+paneID+'>.new-plot>.date').datepicker("getDate")
  hour=$('#'+paneID+'>.new-plot>#date_hour')[0].selectedIndex
  phase=$('#'+paneID+'>.new-plot>#phase_id')[0].selectedIndex+1
  requestURL='/plots/'+date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate()+'/'+hour+'/'+phase+'.png'
  alert(requestURL)
  $('#'+paneID).fadeTo(0.5)
  
