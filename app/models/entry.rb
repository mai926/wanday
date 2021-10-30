class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :account, class_name: 'Account', foreign_key: 'user_id'
end
