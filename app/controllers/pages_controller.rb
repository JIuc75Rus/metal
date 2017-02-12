class PagesController < ApplicationController
  include Find
  before_action :set

  def index
    @categories = Category.all
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

end
