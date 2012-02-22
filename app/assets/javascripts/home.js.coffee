## Place all the behaviors and hooks related to the matching controller here.
## All this logic will automatically be available in application.js.

$ = jQuery;
$ ->
  $('#new-plot').click(addPlotPane);
  setupUI();
  $('.delete-plot').click(deletePlotPane);
  $('.create-plot').click(requestPlot);

setupUI = ->
   $('#tabs').tabs();
   $('.date').datepicker({defaultDate: null});
   $('.plot').addClass('ui-widget ui-widget-content ui-corner-all');
   $('.plot-header').addClass('ui-widget-header ui-dialog-titlebar ui-corner-all ui-helper-reset ui-helper-clearfix');
   $('.delete-plot').addClass('close-button');
   $(".delete-plot").button({icons: {primary:'ui-icon-closethick'}, text:false});
   $(".create-plot").button({icons: {primary: 'ui-icon-check'}, label: "Create"});
   $("#new-plot").button({icons: {secondary: 'ui-icon-circle-plus'}, label: 'Add A Plot'});

