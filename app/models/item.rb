class Item < ActiveRecord::Base
	has_many :imgUrls, :through => :imgUrlList
	has_many :sizes, :through => :sizeList
end
