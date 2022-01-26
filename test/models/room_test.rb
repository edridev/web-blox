require 'test_helper'

class RoomTest < ActiveSupport::TestCase

	test "name cannot be blank" do
		a = rooms(:one)
		a.name=""
		assert_not a.valid?
	end

  test "name must be unique" do
		a = rooms(:one)
		b = rooms(:two)
		b.name=a.name
		assert_not b.valid?
	end


end
