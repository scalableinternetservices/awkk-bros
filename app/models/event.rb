class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  def self.search(search)
    where("name LIKE ? OR description LIKE ? OR city LIKE ? OR location LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
