Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # ホーム画面(最初にアクセスしたときのビューの指定)
  root 'home#index'                                                                         # ホーム画面

  # はじめての方へ #
  get '/beginner',                                  to: 'beginner#index'                    # 鍼灸治療とは
  get '/beginner/visit',                            to: 'beginner#visit'                    # ご来院にあたって
  get '/beginner/self-introduction',                to: 'beginner#self-introduction'        # 施術者紹介

  # 施術の流れ #
  get '/procedure_flow',                            to: 'procedure_flow#index'              # 施術の流れ

  # 治療方針 #
  get '/treatment_policy',                          to: 'treatment_policy#index'            # 治療方針
  get '/treatment_policy/faq',                      to: 'treatment_policy#faq'              # こんな症状にお悩みなら
  get '/treatment_policy/lifestyle',                to: 'treatment_policy#lifestyle'        # ライフスタイルに合わせた治療方針
  get '/treatment_policy/reverberation',            to: 'treatment_policy#reverberation'    # 痛い鍼はヘタなのか

  # お問い合わせ #
  get   '/contact',                                 to: 'contact#index'                     # お問い合わせ
  get   '/contact/confirm',                         to: 'contact#index'                     # お問い合わせ
  post  '/contact/confirm',                         to: 'contact#confirm'                   # 確認画面
  get   '/contact/thanks',                          to: 'home#index'                        # ホーム画面
  post  '/contact/thanks',                          to: 'contact#thanks'                    # 送信完了

  # ログイン系 #
  get     '/login',                                 to: 'sessions#new'
  post    '/login',                                 to: 'sessions#create'
  delete  '/logout',                                to: 'sessions#destroy'

  # その他 #
  get '/other/calender',                            to: 'other#calender'                    # カレンダー一覧

  # 管理者用 #
  get     '/tasks',                                 to: 'tasks#index'                       # 管理者ページログイン画面
  get     '/tasks/logged_in',                       to: 'tasks#_logged_in'                  # ログイン成功(設定画面へ)
  get     '/tasks/not_logged_in',                   to: 'tasks#_not_logged_in'              # ログイン失敗(ログイン画面へ)
  get     '/tasks/regular_holiday_setting',         to: 'tasks#regular_holiday_setting'     # 定休日設定
  post    '/tasks/regular_holiday_setting',         to: 'tasks#set_regular_holiday'         # 定休日設定(データ登録処理)
  get     '/tasks/specific_holiday_setting',        to: 'tasks#specific_holiday_setting'    # 特別休日設定
  post    '/tasks/specific_holiday_setting',        to: 'tasks#set_holiday'                 # 特別休日設定(データ登録処理)
  delete  '/tasks/specific_holiday_setting',        to: 'tasks#destroy_calender_holiday'    # 特別休日設定(データ消去処理)
  get     '/tasks/information_setting',             to: 'tasks#information_setting'         # INFORMATION設定
  post    '/tasks/information_setting',             to: 'tasks#set_information'             # INFORMATION設定(データ登録処理)
  delete  '/tasks/information_setting',             to: 'tasks#destroy_information'         # INFORMATION設定(データ消去処理)

  # 404/500系エラー対応 #
  # ★★★これは一番下に設定しないとおかしなことになるよ！！★★★
  #get '*not_found' => 'application#routing_error'
  #post '*not_found' => 'application#routing_error'
  # ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

end
