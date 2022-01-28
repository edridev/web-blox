# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Room, type: :model do
	
	before(:all) do
		@room1 = create(:room)
	end
  
	it "is valid with valid attributes" do
    expect(@room1).to be_valid
  end

	it "has a unique name" do
    room2 = build(:user, name: @room1.name)
    expect(room2).to_not be_valid
  end

	it "is not valid without a name" do 
    room2 = build(:user, name: nil)
    expect(room2).to_not be_valid
  end

  after(:all) { Room.destroy_all }
end
