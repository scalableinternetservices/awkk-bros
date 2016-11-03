class Event < ApplicationRecord
	has_many :participants
  has_many :comments
  has_one :user
end
