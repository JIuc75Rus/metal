class SubcategoriesController < ApplicationController
  include Find
  before_action :set
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :edit, :update, :destroy]
  force_ssl

  # GET /subcategories
  # GET /subcategories.json
  def index
    @subcategories = Subcategory.all
    render layout: 'admin'
  end

  # GET /subcategories/1
  # GET /subcategories/1.json
  def show
    @item = Item.where(subcategory_id: @subcategory ).order(id: :asc)
    @page_title       = @subcategory.category.name + ' | ' + @subcategory.name
    @page_description = @subcategory.description
  end

  # GET /subcategories/new
  def new
    @subcategory = Subcategory.new
    render layout: 'admin'
  end

  # GET /subcategories/1/edit
  def edit
    render layout: 'admin'
  end

  # POST /subcategories
  # POST /subcategories.json
  def create
    @subcategory = Subcategory.new(subcategory_params)

    respond_to do |format|
      if @subcategory.save
        format.html { redirect_to :back, notice: 'Subcategory was successfully created.' }
        format.json { render :show, status: :created, location: @subcategory }
      else
        format.html { render :new }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subcategories/1
  # PATCH/PUT /subcategories/1.json
  def update
    respond_to do |format|
      if @subcategory.update(subcategory_params)
        format.html { redirect_to :back, notice: 'Subcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit }
        format.json { render json: @subcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subcategories/1
  # DELETE /subcategories/1.json
  def destroy
    @subcategory.destroy
    respond_to do |format|
      format.html { redirect_to subcategories_url, notice: 'Subcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subcategory
      @subcategory = Subcategory.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subcategory_params
      params.require(:subcategory).permit( :images, :url, :images_url, :parent_id, :name, :description, :category_id)
    end
end
