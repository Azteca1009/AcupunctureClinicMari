class TasksController < ApplicationController
  before_action :login_check

  def index
  end

  def _logged_in
  end

  def _not_logged_in
  end

  #####################################
  # 定休日設定
  #####################################
  def regular_holiday_setting
    @calenderHolidaySchedule = CalenderWeekDay.first
  end

  #####################################
  # 特別休日設定
  #####################################
  def specific_holiday_setting
    t = Time.new
    # 今月以降の特別休日を取得する
    @calenderHolidays = CalenderHoliday.where(date_holiday: t.beginning_of_month..Float::INFINITY).order(date_holiday: :desc)
  end

  #####################################
  # INFORMATION設定
  #####################################
  def information_setting
    @informationSetting = InformationSetting.all.order(date_information: :desc)
  end

  #####################################
  # 定休日登録処理
  #####################################
  def set_regular_holiday
    # 定休日を取得
    holiday_Mon = params[:session][:am_Mon].to_i + params[:session][:pm_Mon].to_i
    holiday_Tue = params[:session][:am_Tue].to_i + params[:session][:pm_Tue].to_i
    holiday_Wed = params[:session][:am_Wed].to_i + params[:session][:pm_Wed].to_i
    holiday_Thu = params[:session][:am_Thu].to_i + params[:session][:pm_Thu].to_i
    holiday_Fri = params[:session][:am_Fri].to_i + params[:session][:pm_Fri].to_i
    holiday_Sat = params[:session][:am_Sat].to_i + params[:session][:pm_Sat].to_i
    holiday_Sun = params[:session][:am_Sun].to_i + params[:session][:pm_Sun].to_i

    # 定休日テーブルを取得
    calenderRegularHoliday = CalenderWeekDay.first

    # データアップデート
    calenderRegularHoliday.update(\
      monday: holiday_Mon\
      , tuesday: holiday_Tue\
      , wednesday: holiday_Wed\
      , thursday: holiday_Thu\
      , friday: holiday_Fri\
      , saturday: holiday_Sat\
      , sunday: holiday_Sun\
    )

    # ホームに戻る
    redirect_to root_path
  end

  #####################################
  # 特別休日登録処理
  #####################################
  def set_holiday
    date_holiday = params[:session][:date_holiday]

    # 整形が必要であればこれを使用する
    cal_Holiday = CalenderHoliday.find_by(date_holiday: date_holiday)

    # 指定日があるのなら
    if cal_Holiday
      # 指定日があるんでもう一度
      redirect_to '/tasks/specific_holiday_setting'
    else

      # 祝日判定
      if HolidayJp.holiday?(Date.parse(date_holiday))
        # 祝日フラグを1に
        holidayFlg = 1
      # そうでないなら
      else
        # 祝日フラグを0に
        holidayFlg = 0
      end

      # 特別休日の登録
      calender_holiday = CalenderHoliday.new(date_holiday: date_holiday, holiday_flg: holidayFlg)
      if calender_holiday
        calender_holiday.save
      end
      # 特別休日一覧に戻る
      redirect_to tasks_specific_holiday_setting_path
    end
  end

  #####################################
  # INFOMATION設定処理
  #####################################
  def set_information
    # パラメータの取得
    date_information = params[:session][:date_information]
    title = params[:session][:title]
    comment = params[:session][:comment]

      # INFOMATIONの登録
      information_setting = InformationSetting.new(date_information: date_information, title: title, comment: comment)
      if information_setting
        information_setting.save
      end
      # 一覧に戻る
      redirect_to tasks_information_setting_path
  end

  #####################################
  # ログインチェック
  #####################################
  def login_check
    # セッションに登録されていなければ
    if !session[:login]
      # ホームに戻る
      redirect_to root_path
    end
  end

  #####################################
  # 削除処理
  #####################################
  def destroy_calender_holiday
    # 削除対象の特別休日を取得
    delete_Cal =  CalenderHoliday.find(params[:id])

    # あるなら削除
    if delete_Cal
      delete_Cal.destroy
    end

    # 特別休日一覧に戻る
    redirect_to tasks_specific_holiday_setting_path
  end

  #####################################
  # 削除処理(information)
  #####################################
  def destroy_information
    # 削除対象の特別休日を取得
    information =  InformationSetting.find(params[:id])

    # あるなら削除
    if information
      information.destroy
    end

    # INFORMATION一覧に戻る
    redirect_to tasks_information_setting_path
  end
end
