class Contact < ApplicationRecord

  include ActiveModel::Model
  # メールアドレスチェック用正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # 電話番号チェック用正規表現
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/

  attr_accessor :name, :email, :tel, :age, :comment

  # お名前の制限
  validates :name,    :presence =>  {:message => 'お名前を入力してください'}
  # emailの制限
  validates :email,   format: { with: VALID_EMAIL_REGEX,:message => 'メールアドレスの形式が正しくありません' }
  # 電話番号の制限
  validates :tel,     if: -> { !tel.blank? }, format: { with: VALID_PHONE_REGEX,:message => '電話番号はハイフンなしの半角数値で入力してください' }
  # ご相談内容の制限
  validates :comment, :presence =>  {:message => 'ご相談内容を入力してください'}
end
