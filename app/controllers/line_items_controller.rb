class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy]
  before_action :set_line_item, only: [:update, :destroy]

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  def create
    item = Item.find(params[:item_id])
    @line_item = @cart.add_product(item.id)
      respond_to do |format|
        if @line_item.save
          format.html { redirect_to root_url }
          format.js
          format.json { render action: 'show', status: :created, location: @line_item }
        else
          format.html { render action: 'new' }
          format.json { render json: @line_item.errors,
                               status: :unprocessable_entity }
        end
    end
end


  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:item_id, :cart_id)
    end
end
