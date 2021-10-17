class CalendarsController < ApplicationController
  before_action :select_calendar, only: [:show, :edit, :update,:destroy]

  def index
    @calendars = Calendar.where(user_id: [*current_user])
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_parameter)
    if @calendar.save
      redirect_to calendars_path
    end
  end

  def update
    if @calendar.update(calendar_parameter)
      redirect_to calendar_path
    else
      render 'show'
    end
  end

  def destroy
    @calendar.destroy
    redirect_to calendars_path, notice:"削除しました"
  end

  private
  def calendar_parameter
    params.require(:calendar).permit(:event, :text, :start_time).merge(user_id: current_user.id)
  end

  def select_calendar
    @calendar = Calendar.find(params[:id])
  end
end
