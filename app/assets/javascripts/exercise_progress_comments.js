$(document).on('turbolinks:load', function () {
    
    if ($('#admin-calendar').length) {
        // Initialize the admin calendar

        var userId = new URLSearchParams(window.location.search).get('user_id');

        var adminCalendar = $('#admin-calendar').fullCalendar({


            // Calendar settings similar to `exercise_progresses.js`
            defaultDate: new Date().toISOString().slice(0, 10),
            events: '/admin/exercise_progress_comments.json?user_id=' + userId,
            titleFormat: 'YYYY年 M月',
            dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
            header: {
                left: '',
                center: 'title',
                right: 'today prev,next'
            },
            defaultTimedEventDuration: '03:00:00',
            buttonText: {
                prev: '前',
                next: '次',
                today: '今日',
                month: '月',
                week: '週',
                day: '日'
            },
            editable: true,
            timeFormat: "HH:mm",
            eventColor: '#87cefa',
            eventTextColor: '#000000',
            displayEventTime: false,
            eventRender: function(event, element) {
                element.css("font-size", "0.8em");
                element.css("padding", "5px");
            }

        });

        // Destroy the calendar before the Turbolinks cache is saved
        $(document).on('turbolinks:before-cache', function() {
            if (adminCalendar) {
                adminCalendar.fullCalendar('destroy');
                adminCalendar = null;
            }
        });
    }
});