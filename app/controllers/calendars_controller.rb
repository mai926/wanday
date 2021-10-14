class CalendarsController < ApplicationController
  def index
    @calendars = Calendars.all
    @calendar = Calendars.new
  end
  
  def new
    @calendar = Calendars.new
  end

  def show
    @calendar = Calendars.find(params[:id])
  end

  def create
    Calendars.create(calendar_parameter)
    redirect_to calendar_path
  end

  def destroy
    @calendar = Calendars.find(params[:id])
    @calendar.destroy
    redirect_to calendar_path, notice:"削除しました"
  end

  def edit
    @calendar = Calendars.find(params[:id])
  end

  def update
    @calendar = Calendars.find(params[:id])
    if @calendar.update(calendar_parameter)
      redirect_to calendar_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def calendar_parameter
    params.require(:calendar).permit(:event, :text, :start_time).(user_id: current_user.id)
  end
end
