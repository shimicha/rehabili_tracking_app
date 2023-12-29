$(document).on('turbolinks:load', function () {
    if ($('#calendar').length) {

        var urlParams = new URLSearchParams(window.location.search);
        var monthParam = urlParams.get('month');

        // 英語の月名を月のインデックスに変換するマッピング
        var monthNames = {
            "January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6,
            "July": 7, "August": 8, "September": 9, "October": 10, "November": 11, "December": 12
        };

        var currentYear = new Date().getFullYear();
        var monthIndex = monthParam ? monthNames[monthParam] : new Date().getMonth();
        var defaultDate = new Date(currentYear, monthIndex, 1);

        // カレンダーを初期化
        var calendar = $('#calendar').fullCalendar({
            defaultDate: defaultDate.toISOString().slice(0, 10),
            events: '/exercise_progresses.json', // exercise_progresseモデルに対応したパスを指定
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
                prevYear: '前年',
                nextYear: '翌年',
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
            }
        });

        

        // カレンダーが破棄される前に処理を実行
        $(document).on('turbolinks:before-cache', function() {
            if (calendar) {
                calendar.fullCalendar('destroy');
                calendar = null;
            }
        });
    }
});
