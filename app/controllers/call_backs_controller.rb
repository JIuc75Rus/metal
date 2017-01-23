class CallBacksController < ApplicationController

  def new
    @call_back = CallBack.new
  end

  def create
    @call_back = CallBack.new(params[:call_back])
    @call_back.times = Time.parse(params[:call_back][:"times(4i)"] + ":" + params[:call_back][:"times(5i)"]).strftime('%H:%M')
    CallBackMailer.call_back(@call_back).deliver
    redirect_to :back
  end
end