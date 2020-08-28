document.addEventListener("turbolinks:load",function () {
  $(document).ready(function() {
    $('#calendar').fullCalendar({
      displayEventTime : false,
      header: {
        left: 'prev,next',
        center: 'title',
      },
      events: {
        url: '/reservations.json',
        method: 'GET', 
        data: JSON.stringify({
          title: title,
          start_date: start.toISOString(),
          end_date: end.toISOString()
      }),
        failure: function() {
          alert('error!');
      },
        color: 'pink',
      },  
      eventClick : function(event, jsEvent , view) {
        if(!confirm('本当に削除しますか？')){
          return false;
        }else{
          var EventID = (event.id);
          $.ajax({
            url: "/reservations/" + EventID,
            type: "POST",
            data: {"id": EventID, _method: "delete"}
          });
        }
      },
    });
  });
});
