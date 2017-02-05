class PagesController < ApplicationController
  include Find
  before_action :set
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show

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
end
