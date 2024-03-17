class HomeController < ApplicationController
  #####################################
  # ホーム処理
  #####################################
  def index
    ####################
    # カレンダー表示処理
    ####################
    # 現在日を取得
    t = Time.new
    # 当月を取得
    @nowMonth = getNowMonth(t)
    # 当月の最終日を取得
    @lastDay = getLastDay(t)
    # 当月の最後の日を取得
    @firstWeekDay = getFirstWeekDay(t)
    # 当月の最後の日と最初の曜日からその月の週の数を計算
    @weekNum = getWeeks(@lastDay, @firstWeekDay)
    # 曜日の指定
    @week = ["日","月","火","水","木","金","土"]
    @holidayWeek = getHolidayWeek()
    @holiday = CalenderHoliday.where(:date_holiday=> t.beginning_of_month..t.end_of_month)

    # INFORMATION設定
    @information_setting = InformationSetting.where.not(date_information: t.tomorrow..Float::INFINITY).order(date_information: :desc).limit(3)
  end

  #####################################
  # 年月取得
  #####################################
  def getNowMonth(t)
    return t.strftime("%Y年%m月")
  end

  #####################################
  # 最終日取得
  #####################################
  def getLastDay(t)
    return Date.new(t.year, t.month, -1).day
  end

  #####################################
  # 初日の曜日を取得
  #####################################
  def getFirstWeekDay(t)
    return Date.new(t.year, t.month, 1).wday
  end

  #####################################
  # 週の数を計算
  #####################################
  def getWeeks(lastday, firstWeekday)
    amari = lastday % 7
    weeks = 0;

    case amari + firstWeekday
    when 0 then
      weeks = 4
    when 1,2,3,4,5,6,7
      weeks = 5
    else
      weeks = 6
    end
    return weeks
  end

  #####################################
  # 週の休みを取得
  #####################################
  def getHolidayWeek
    cWeekDay = CalenderWeekDay.find(1)
    holidayWeeks = [cWeekDay[:sunday],cWeekDay[:monday],cWeekDay[:tueday],cWeekDay[:wendnesday],cWeekDay[:thursday],cWeekDay[:friday],cWeekDay[:saturday]]
    return holidayWeeks
  end
end
