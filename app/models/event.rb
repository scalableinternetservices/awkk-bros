class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
end
