class Profile < ApplicationRecord
  belongs_to :user

  validates :name, presence: ture
end
