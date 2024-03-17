class TreatmentPolicyController < ApplicationController
  # 治療方針
  def index
  end

  # こんな症状にお悩みなら
  def faq
    # オープンさせるfaqがあれば値が入ってくる
    @faqID = params[:faq_id];
  end

  # ライフスタイルに合わせた治療方針
  def lifestyle
  end

  # 痛い鍼はヘタなのか
  def reverberation
  end
end
