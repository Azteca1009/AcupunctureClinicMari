class ApplicationController < ActionController::Base
  before_action :get_calender_holiday_schedule

  # 共通でセッションを使用できるようにする
  include SessionsHelper

  # エラーの判定
  # unless Rails.env.development? #商用環境のみ動作させたい場合
  # 開発環境も含め動作させたいのでproductionに設定している
#   unless Rails.env.production?
#     rescue_from Exception,                      with: :render_500
#     rescue_from ActiveRecord::RecordNotFound,   with: :render_404
#     rescue_from ActionController::RoutingError, with: :render_404
#   end
#
#   # エラーに対する
#   def routing_error
#     raise ActionController::RoutingError, params[:path]
#   end
#
# private
#   # 404系エラー
#   def render_404
#     render 'error/404', status: :not_found
#   end
#
#   # 500系エラー
#   def render_500
#     render 'error/500', status: :internal_server_error
#   end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
   unless logged_in?
     redirect_to login_url
   end
  end

  # 定休日の取得
  def get_calender_holiday_schedule
    @calenderHolidaySchedule = CalenderWeekDay.first
  end

end
