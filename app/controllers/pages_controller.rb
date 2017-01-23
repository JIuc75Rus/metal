class PagesController < ApplicationController

  before_action :set_category, only: [:show]
  before_action :article, only: [:show, :index, :company, :contacts, :contact, :news]

  def index
    @categories = Category.all
  end

  def show
    @items = Item.where(cat_id: [@category])
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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.friendly.find(params[:id])
  end
   def article
     @article = Article.where('created_at > ?', 14.days.ago).limit(3).sort {|a,b| b <=> a}
   end
end
