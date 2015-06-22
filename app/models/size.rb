class Size < ActiveRecord::Base
	belongs_to :sizeList, inverse_of: :size
end
