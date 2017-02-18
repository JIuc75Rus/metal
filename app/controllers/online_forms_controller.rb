class OnlineFormsController < ApplicationController


  def new
    @online_form = OnlineForm.new
  end

  def create
    @online_form = OnlineForm.new(params[:online_form])
    OnlineFormMailer.online_form(@online_form).deliver
    redirect_to :back
  end
end