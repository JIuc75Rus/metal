module Find
  extend ActiveSupport::Concern
  private
  def set
    offset = rand(Advert.count)
    @advert = Advert.where('id >= ?', offset).limit(1)
    @article = Article.where('created_at > ?', 14.days.ago).limit(3).sort {|a,b| b <=> a}
  end
end