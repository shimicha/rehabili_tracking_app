$(document).on('turbolinks:load', function () {
    if ($('#calendar').length) {

        var currentDate = new Date();

        // カレンダーを初期化
        var calendar = $('#calendar').fullCalendar({
            defaultDate: currentDate,
            googleCalendarApiKey: 'GOOGLE_CALENDAR_API_KEY',
            eventSources: [
                // Custom event source
                {
                    events: {
                        url: '/exercise_progresses.json'
                    }
                },
            
                // Google Calendar holiday events
                {
                    googleCalendarId: 'ja.japanese#holiday@group.v.calendar.google.com',
                    className: 'event_holiday'
                }
            ],
            // カレンダー上部を年月で表示させる
            titleFormat: 'YYYY年 M月',
            // 曜日を日本語表示
            dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],
            // ボタンのレイアウト
            header: {
                left: '',
                center: 'title',
                right: 'today prev,next'
            },
            // 終了時刻がないイベントの表示間隔
            defaultTimedEventDuration: '03:00:00',
            buttonText: {
                prev: '前',
                next: '次',
                today: '今日',
                month: '月',
                week: '週',
                day: '日'
            },
            // Drag & Drop & Resize
            editable: true,
            // イベントの時間表示を２４時間に
            timeFormat: "HH:mm",
            // イベントの色を変える
            eventColor: '#87cefa',
            // イベントの文字色を変える
            eventTextColor: '#000000',
            
            displayEventTime: false,

            
            
            eventRender: function(event, element) {
                
                element.css("font-size", "0.8em");
                element.css("padding", "5px");

                // 土曜日の場合
                if (event.start.day() === 6) { // 6は土曜日を表します
                    element.addClass('fc-sat'); // カスタムCSSクラスを追加
                }

                // 日曜日の場合
                if (event.start.day() === 0) { // 0は日曜日を表します
                    element.addClass('fc-sun'); // カスタムCSSクラスを追加
                }
            },
            // カレンダーが完全に描画された後に実行される関数
            eventAfterAllRender: function(view) {
                setDayColors();
            }
        });

        // カスタムCSSクラスのスタイルを定義
        function setDayColors() {
            $('.fc-sat').css({
                'color': '#0000FF', // 土曜日の文字色
                'background-color': '#CCEEFF' // 土曜日の背景色
            });

            $('.fc-sun').css({
                'color': '#FF0000', // 日曜日の文字色
                'background-color': '#FFCCCF' // 日曜日の背景色
            });
        }


        // カレンダーが破棄される前に処理を実行
        $(document).on('turbolinks:before-cache', function() {
            if (calendar) {
                calendar.fullCalendar('destroy');
                calendar = null;
            }
        });
        
    }
});
