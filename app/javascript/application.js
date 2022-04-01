// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require moment 
//= require fullcalendar

$('#calendar').fullCalendar({ });

function eventCalendar() {
  return $('#calendar').fullCalendar({ });
};

function clearCalendar() {
  $('#calendar').fullCalendar('delete'); 
  $('#calendar').html('');
};

$(document).on('turbolinks:load', function(){
  eventCalendar();  
});

$(document).on('turbolinks:before-cache', clearCalendar);