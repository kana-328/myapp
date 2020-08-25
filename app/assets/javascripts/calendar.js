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
          $('#modalTitle').html(event.title); // モーダルのタイトルをセット
          $('#modalBody').html(event.description); // モーダルの本文をセット
          $('#calendarModal').modal(); // モーダル着火
        
        var EventID = (event.id);
          $.ajax({
            url: "/reservations/" + EventID,
            type: "POST",
            data: {"id": EventID, "_method": "DELETE"}
          });
       },
    });
  });
});
