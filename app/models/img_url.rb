class ImgUrl < ActiveRecord::Base
	belongs_to :imgUrlList, inverse_of: :imgUrls
end
