class ContactMailer < ApplicationMailer
  # デフォルト設定これも環境変数に登録しておくのがいいかと
  default from: ENV['MAIL_ACCOUNT']            # 送信元アドレス
  # default to:   "doragoroujapan@yahoo.co.jp"    # 送信先アドレス
  default to:   ENV['MAIL_DEFAULT_TO']       # 送信先アドレス

  # メール送信メソッド
  def received_email(contact)
    @contact = contact
    mail(:subject => 'お問い合わせ通知')
  end
end
