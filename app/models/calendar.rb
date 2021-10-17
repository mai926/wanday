class Calendar < ApplicationRecord
  belongs_to :user

  validates :event, presence: true
  validates :text, presence: true
  validates :start_time, presence: true
end
