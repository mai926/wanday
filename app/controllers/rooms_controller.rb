class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create(user_id: current_user.id)
    @entry1 = Entry.create(room_id: @room.id, user_id: current_user.id)
    @entry2 = Entry.create(entry_params)
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_to home_path(current_user)
    end
  end

  private

  def entry_params
    params.permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end
