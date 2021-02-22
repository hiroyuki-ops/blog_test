class Article < ApplicationRecord

	belongs_to :user
	validates :title, presence: true
	validates :body, presence: true
	
	attachmet :image
end
