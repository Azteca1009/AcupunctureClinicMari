class ContactController < ApplicationController
  # 入力画面
  def index
    @contact = Contact.new
    render :action => 'index'
  end

  # 入力チェック
  def confirm
    # 入力値のチェック
    @contact = Contact.new(contact_params)
    # パラメータがある？
    if @contact.valid?
      # OK 確認画面を表示
      render :action => 'confirm'
    else
      # NG 入力画面を再表示
      render :action => 'index'
    end
  end

  # ありがとう
  def thanks
    # 送信パラメータを設定
    @contact = Contact.new(contact_params)
    # メール送信
    ContactMailer.received_email(@contact).deliver
    # 完了画面を表示
    render :action => 'thanks'
  end
private
  def contact_params
    params.require(:contact).permit(:name,:email, :tel, :age, :comment)
  end
end
