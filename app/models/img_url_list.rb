class ImgUrlList < ActiveRecord::Base
	belongs_to :item
	has_many :imgUrls, inverse_of: :imgUrlList
end
