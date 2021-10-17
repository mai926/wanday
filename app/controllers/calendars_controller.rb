class CalendarsController < ApplicationController
  def index
    # @calendars = Calendar.find(user_id: [*current_user])
    @calendars = Calendar.where(user_id: [*current_user])
    @calendar = Calendar.new
  end
  
  # def new
  #   @calendar = Calendar.new
  # end

  # def show
  #   @calendar = Calendar.find(params[:id])
  # end

  def create
    @calendar = Calendar.new(calendar_parameter)
    if @calendar.save
      redirect_to calendars_path
    end
    # Calendar.create(calendar_parameter)
    # redirect_to calendars_path
  end

  # def destroy
  #   @calendar = Calendar.find(params[:id])
  #   @calendar.destroy
  #   redirect_to calendar_path, notice:"削除しました"
  # end

  # def edit
  #   @calendar = Calendar.find(params[:id])
  # end

  # def update
  #   @calendar = Calendar.find(params[:id])
  #   if @calendar.update(calendar_parameter)
  #     redirect_to calendar_path, notice: "編集しました"
  #   else
  #     render 'edit'
  #   end
  # end

  private

  def calendar_parameter
    params.require(:calendar).permit(:event, :text, :start_time).merge(user_id: current_user.id)
  end
end
