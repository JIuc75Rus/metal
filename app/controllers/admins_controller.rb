class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  layout 'admin'
  def index
    @categories = Category.all
    @subcategories = Subcategory.all
    @items = Item.all
  end
end
