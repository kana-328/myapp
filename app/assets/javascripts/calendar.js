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
      },        
        eventClick: function(calEvent, jsEvent, view) {
          if(!confirm('削除しますか？')){
            return false;
          }else{
          $('#calendar').fullCalendar("removeEvents", calEvent._id);
          }
       },

    });
  });
});