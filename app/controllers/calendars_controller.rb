class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :select_calendar, except: [:index, :create]
  before_action :pet_select, only: [:show]

  def index
    @calendars = Calendar.where(user_id: [*current_user])
    @calendar = Calendar.new
    @pet = current_user.pet
  end

  def create
    @calendar = Calendar.new(calendar_parameter)
    redirect_to calendars_path if @calendar.save
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
    redirect_to calendars_path
  end

  private

  def calendar_parameter
    params.require(:calendar).permit(:event, :text, :start_time).merge(user_id: current_user.id)
  end

  def pet_select
    @pet = current_user.pet
  end

  def select_calendar
    @calendar = Calendar.find(params[:id])
  end
end
