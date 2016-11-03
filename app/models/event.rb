class Event < ApplicationRecord
	has_many :participants
  has_many :comments
  belongs_to :user
end
