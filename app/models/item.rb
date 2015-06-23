class Item < ActiveRecord::Base
	validates :url, presence: true
	has_many :imgUrls, :through => :imgUrlList
	has_many :sizes, :through => :sizeList
end
