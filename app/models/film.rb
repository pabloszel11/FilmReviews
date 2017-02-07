class Film < ApplicationRecord
	belongs_to :user
	has_many :reviews
	has_many :genres, through: :associations
	has_many :associations

  	has_attached_file :film_img, styles: { film_index: "357x500>", film_show: "410x600>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :film_img, content_type: /\Aimage\/.*\z/

end
