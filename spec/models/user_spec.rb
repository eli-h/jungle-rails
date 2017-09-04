require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation tests/examples here
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  context "Relationships:" do

	  before :each do
	    @user1 = User.create!({
	    	password: '123456',
	    	password_confirmation: '123456',
	    	name: 'goku', 
	    	email: 'goku@dbz.com' 
	    	})

	    @user2 = User.create!({
	    	password: '654321',
	    	password_confirmation: '654321',
	    	name: 'goku2', 
	    	email: 'Goku@dbz.com' 
	    	})
	  end

	  it "Passwords should match" do
	    expect(@user1.password).to eq(@user1.password_confirmation)
	  end

	  it "emails must be unique" do
	  	expect(@user1.email).not_to eq(@user2.email)
	  end

	  describe '.authenticate_with_credentials' do
    # examples for this class method here
	    puts User.all.inspect
	    it 'email/password authentication' do
	    	puts User.all.inspect
	      expect(User.authenticate_with_credentials(@user1.email, @user1.password)).to eq(nil)
	    end

    end

	end

end

  # create_table "users", force: :cascade do |t|
  #   t.string   "name"
  #   t.string   "email"
  #   t.string   "password_digest"
  #   t.datetime "created_at",      null: false
  #   t.datetime "updated_at",      null: false
  # end
