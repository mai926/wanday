class Account < ApplicationRecord
  belongs_to :user, optional: true
  validates :nickname, :account_id, :birthday, presence: true
  validate :account_id, uniqueness: true
end