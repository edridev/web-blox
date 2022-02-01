# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  email                  :string
#  encrypted_password     :string
#  full_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:francisco)
  end

  teardown do
    Rails.cache.clear
  end

  test "has not valid attributes" do
    assert @user.valid?
  end

  test "should not save user without full_name" do
    @user.full_name = nil
    assert_not @user.save
  end

  test "should not save user without username" do
    @user.username = nil
    assert_not @user.save
  end

  test "should not save user without email" do
    @user.email = nil
    assert_not @user.save
  end

  test "should be to exist the book_date_fmt attribute " do
    user2 = users(:admin)
    user2.username = nil
    @user.email = nil
    assert (@user.login && user2.login)
  end

  test 'does not have has_many with books' do
    book = books(:_09h)
    @user.books << book
    @user.reload
    assert_not_empty @user.books
  end


end
