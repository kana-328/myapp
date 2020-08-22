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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require moment
//= require fullcalendar
//= require bootstrap-sprockets
//= require popper
//= require_tree .

document.addEventListener("turbolinks:load",function () {
  $(document).ready(function() {
    $('#calendar').fullCalendar({
      displayEventTime : false,
      header: {
        left: 'prev,next',
        center: 'title',
        right: 'month,agendaWeek'
      },
      events: {
        url: '/reservations.json',
        method: 'GET', 
        eventTimeFormat: { 
        hour: 'numeric',
        minute: '2-digit',
        omitZeroMinute: true,
        meridiem: 'narrow',
      },
        failure: function() {
          alert('error!');
        },
        color: 'pink',
      }
    });
  });
});
