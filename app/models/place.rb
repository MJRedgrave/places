class Place < ActiveRecord::Base

	# add geocoder
	geocoded_by :post_code
	after_validation :geocode

	validates :title, presence: true
	validates :post_code, presence: true


end
