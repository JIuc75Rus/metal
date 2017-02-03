class AdminsController < ApplicationController

  layout 'admin'
  def index
    @categories = Category.all
    @subcategories = Subcategory.all
    @itemscategories = Itemscategory.all
    @items = Item.all
  end
end
