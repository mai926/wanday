class Account < ApplicationRecord
  belongs_to :user, optional: true
  validates :nickname, :account_id, :birthday, presence: true
  # validates :account_id, uniqueness: true
  validates :account_id, format: { with: /\A[a-zA-Z0-9]+\z/}, uniqueness: true, length: {minimum:6}
end