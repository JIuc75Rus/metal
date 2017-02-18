class CallBacksController < ApplicationController
  force_ssl
  def new
    @call_back = CallBack.new
  end

  def create
    @call_back = CallBack.new(params[:call_back])
    CallBackMailer.call_back(@call_back).deliver
    redirect_to :back
  end
end