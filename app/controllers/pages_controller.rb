class PagesController < ApplicationController
  include Find
  before_action :set


  def index
    @categories = Category.all
    @page_title = 'Меркурий - торговая компания : : Цветной металлопрокат, РТИ, АТИ, полимеры в Бийске.'
  end

  def products
    @subcategory = Subcategory.all
    @category = Category.find_by(id: @subcategory)
  end

  def company
    render 'company'
  end

  def contacts
    render 'contact'
  end

  def feedback
    render 'feedback'
  end
  def news
    @articles = Article.all
  end
  def sitemap
    respond_to do |format|
      format.xml { render file: 'public/sitemaps/sitemap.xml' }
      format.html { redirect_to root_url }
    end
  end

end
