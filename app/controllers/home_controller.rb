class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :user_select, except: [:index]
  before_action :pet_select, only: [:show, :profile_edit, :profile_update]
  before_action :move_to_home_show, only: [:profile_new, :profile_create, :profile_edit, :profile_update]
  def show
    @account = Account.find(params[:id])
    @likes = @user.likes
    # @post = Post.find(params[:id])
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
  end

  def profile_index
    @account = Account.find(params[:id])
  end

  def profile_new
    @pet = Pet.new
  end

  def profile_create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to home_profile_index_path(current_user)
    else
      render 'new'
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
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :dog_breed, :birthday, :favorite, :character, images: []).merge(user_id: current_user.id)
  end

  def move_to_home_show
    if current_user.id != @user.id
      redirect_to home_path(current_user)
    end
  end
end
