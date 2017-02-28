class Category < ApplicationRecord
	validates :name, presence: true
	has_many :articles, through: :has_categories
	has_many :has_categories
end
