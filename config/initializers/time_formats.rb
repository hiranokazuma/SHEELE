
Time::DATE_FORMATS[:date_jp] = "%Y年 %m月 %d日"
Time::DATE_FORMATS[:datetime_jp] = '%Y年%m月%d日' + "\n" + '%H時%M分%S秒'
Time::DATE_FORMATS[:datetime_jp].gsub(/\R/, "<br>")
