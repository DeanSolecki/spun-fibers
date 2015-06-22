class SizeList < ActiveRecord::Base
	has_many :sizes, inverse_of: :sizeList
end
