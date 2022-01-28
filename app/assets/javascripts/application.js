// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require moment 
//= require fullcalendar
//= require fullcalendar/lang/pt-br

$(function () {
  $(".table-action > a").tooltip();
});

/*$('#calendar').fullCalendar({
  events: '/events.json'
});*/

function eventCalendar() {
  const ev = { events: window.location.pathname } 
  return $('#calendar').fullCalendar(ev);
};

function clearCalendar() {
  $('#calendar').fullCalendar('delete'); 
  $('#calendar').html('');
};

$(document).on('turbolinks:load', function(){
  eventCalendar();

  $('#book_book_date_1i,#book_book_date_2i,#book_book_date_3i,#book_room_id').change(function() {
      room = $("#book_room_id option").filter(':selected').val()
      hour = $("#book_schedule")[0].defaultValue
      let dt =  $('#book_book_date_1i').find(":selected").val() + '-' +
              $('#book_book_date_2i').find(":selected").val() + '-' +
              $('#book_book_date_3i').find(":selected").val()
    url = "/unreserveds/"+room+'/'+dt+'/'+hour
    $.get( url, function( data ) {
      options=data.map(function(item){
        return '<option value="'+item+'">'+item+'</option>'
      })
      $('#book_schedule')
        .empty()
        .append('<option></optionj>')
        .append(options)
    });
  })
});
$(document).on('turbolinks:before-cache', clearCalendar);