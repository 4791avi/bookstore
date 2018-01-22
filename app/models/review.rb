class Review < ApplicationRecord
	belongs_to :usr, required: false
	belongs_to :book, required: false
end
