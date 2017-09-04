require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    # validation tests/examples here
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:category) }
  end

  context "Relationships:" do

	  before :each do
	    @category = Category.create!({name: 'GPU'})
	    @product = Product.create!({
	    	name: 'GTX1080Ti', 
	    	price: 1000, 
	    	quantity: 200, 
	    	category: @category})
	  end

	  it "Should belong to category" do
	    expect(@product.category).to eq(@category)
	  end

	end

end
