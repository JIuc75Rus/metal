class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:index, :new, :show, :edit, :update, :destroy]


  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    render layout: 'admin'
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  def who_bought
    @item = Item.find(params[:id])
    @latest_order = @item.orders.order(:updated_at).last
    if stale?(@latest_order)
      respond_to do |format|
        format.atom
      end
    end
  end

  # GET /items/new
  def new
    @item = Item.new
    render layout: 'admin'
  end

  # GET /items/1/edit
  def edit
    render layout: 'admin'
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { render layout: 'admin', action: :edit}
        flash[:notice] = 'Запись успешно создона!'
        format.json { render layout: 'admin', action: :show, status: :created, location: @item }
      else
        format.html { render layout: 'admin', action: :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { render layout: 'admin', action: :edit }
        flash[:notice] = 'Запись успешно отредактирована!'
        format.json { render layout: 'admin', action: :edit, status: :ok, location: @item }
      else
        format.html { render layout: 'admin', action: :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to admins_path }
      flash[:notice_alert] = 'Материал удален!'
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title,  :subcategory_id,  :description, :images, :images_url)
    end
end
