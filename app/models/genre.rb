class Genre < ApplicationRecord
	has_many :films, through: :associations
	has_many :associations
end
