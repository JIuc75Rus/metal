class ItemscategoriesController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :set_itemscategory, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new,  :edit, :update, :destroy]

  # GET /itemscategories
  # GET /itemscategories.json
  def index
    @itemscategories = Itemscategory.all
  end

  # GET /itemscategories/1
  # GET /itemscategories/1.json
  def show
    @article = Article.where('created_at > ?', 14.days.ago).limit(3).sort {|a,b| b <=> a}
    @item = Item.where(itemscategory_id: [@itemscategory])
  end

  # GET /itemscategories/new
  def new
    @itemscategory = Itemscategory.new
    render layout: 'admin'
  end

  # GET /itemscategories/1/edit
  def edit
  end

  # POST /itemscategories
  # POST /itemscategories.json
  def create
    @itemscategory = Itemscategory.new(itemscategory_params)

    respond_to do |format|
      if @itemscategory.save
        format.html { redirect_to @itemscategory, notice: 'Itemscategory was successfully created.' }
        format.json { render :show, status: :created, location: @itemscategory }
      else
        format.html { render :new }
        format.json { render json: @itemscategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itemscategories/1
  # PATCH/PUT /itemscategories/1.json
  def update
    respond_to do |format|
      if @itemscategory.update(itemscategory_params)
        format.html { redirect_to @itemscategory, notice: 'Itemscategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @itemscategory }
      else
        format.html { render :edit }
        format.json { render json: @itemscategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itemscategories/1
  # DELETE /itemscategories/1.json
  def destroy
    @itemscategory.destroy
    respond_to do |format|
      format.html { redirect_to itemscategories_url, notice: 'Itemscategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itemscategory
      @itemscategory = Itemscategory.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itemscategory_params
      params.require(:itemscategory).permit( :images, :url, :images_url, :parent_id, :name, :description, :subcategory_id)
    end


end
