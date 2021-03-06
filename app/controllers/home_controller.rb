class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:profile_edit, :profile_new]
  before_action :user_select, except: [:index]
  before_action :pet_select, only: [:profile_edit, :profile_update]
  before_action :move_to_home_show, only: [:profile_new, :profile_create, :profile_edit, :profile_update]

  def index
    redirect_to posts_path if user_signed_in?
  end

  def show
    @account = Account.find(params[:id])
    @likes = @user.likes
  end

  def like_list
    @account = Account.find(params[:id])
    @likes = @user.likes
  end

  def follower
    @follower_users = @user.followers
  end

  def following
    @following_users = @user.followings
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)

    @following_users.each do |following_user|
      next if following_user.id == current_user.id

      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def profile_index
    @account = Account.find(params[:id])
    @pet = @user.pet
  end

  def profile_new
    @pet = Pet.new
  end

  def profile_create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to home_profile_index_path(current_user)
    else
      render 'profile_new'
    end
  end

  def profile_update
    if @pet.update(pet_params)
      redirect_to home_profile_index_path(current_user)
    else
      render 'edit'
    end
  end

  private

  def user_select
    @user = User.find(params[:id])
  end

  def pet_select
    @pet = current_user.pet
  end

  def pet_params
    params.require(:pet).permit(:name, :dog_breed, :birthday, :favorite, :character, :image).merge(user_id: current_user.id)
  end

  def move_to_home_show
    redirect_to home_path(current_user) if current_user.id != @user.id
  end
end
