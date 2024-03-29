class CalenderHoliday < ApplicationRecord
  # 年月日判定用正規表現
  VALID_DATE_REGEX = /\A[0-9]{4}-([0]{1}[1-9]{1}|[1]{1}[0-2]{1})-([0]{1}[1-9]{1}|[12]{1}[0-9]{1}|[3]{1}[01]{1})\z/

  # 年月日の制限
  validates :date_holiday,   format: { with: VALID_DATE_REGEX,:message => '年月日の形式が正しくありません' }
end
