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
