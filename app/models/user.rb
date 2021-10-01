class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :account
  has_many :posts, dependent: :destroy
  has_many :comments
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze }
  validates :name, presence: true

  def update_without_current_password(params, *options)
    params.delete(:current_password)
    
    if params[:password].blank?
      params.delete(:password)
    end
    
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
