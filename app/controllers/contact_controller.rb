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
    respond_to do |format|
      # パラメータがある？
      if @contact.valid?
        # OK 確認画面を表示
        format.html { render :confirm, status: :unprocessable_entity }
      else
        # NG 入力画面を再表示
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  # ありがとう
  def thanks
    # 送信パラメータを設定
    @contact = Contact.new(contact_params)
    # メール送信
    ContactMailer.received_email(@contact).deliver
    respond_to do |format|
      # 完了画面を表示
      format.html { render :thanks, status: :unprocessable_entity }
    end
  end
private
  def contact_params
    params.require(:contact).permit(:name,:email, :tel, :age, :comment)
  end
end
