class Association < ApplicationRecord
	belongs_to :film
	belongs_to :genre
end
