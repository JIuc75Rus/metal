class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]

  def index
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    render layout: 'admin'
  end

  # GET /categories/new
  def new
    @category = Category.new
    render layout: 'admin'
  end

  # GET /categories/1/edit
  def edit
    render layout: 'admin'
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { render layout: 'admin', action: :new, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render layout: 'admin', action: :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render layout: 'admin', action: :show, status: :ok, location: @category }
      else
        format.html { render layout: 'admin', action: :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :images, :url, :images_url)
    end
end
