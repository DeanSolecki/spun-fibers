require 'rails_helper'

RSpec.describe Item, :type => :model do
	before do
		@item = Item.new(family: "shirt", style: "business", title: "Regular Fit Check Dress Shirt", store: "Nordstrom", brand: "David Donahue",
										url: "http://shop.nordstrom.com/s/david-donahue-regular-fit-check-dress-shirt/3904709?origin=category-personalizedsort&contextualcategoryid=0&fashionColor=&resultback=1160")
	end

	subject { @item }

	describe "when url is not present" do
		before { @item.url = "" }
		it { should_not be_valid }
	end
end

feature 'Items', js: true do
	scenario 'view' do
		visit 'localhost:3000/#!/items'
		expect(page).to have_content('Item One')
	end
end
