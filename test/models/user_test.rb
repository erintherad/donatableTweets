require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User has Twitter Handle" do
    user = User.create(twitter_handle: nil, full_name: "Erin Mahoney")

    assert_equal false, user.valid?

    assert_equal "Twitter handle can't be blank", user.errors.full_messages.first
  end

  test "Twitter handle is unique" do
    user1 = User.create!(twitter_handle: "erintherad", full_name: "Erin Mahoney")
    user2 = User.create(twitter_handle: "erintherad", full_name: "Erin Mahoney")

    assert_equal false, user2.valid?

    assert_equal "Twitter handle has already been taken", user2.errors.full_messages.first
  end

  test "User has name" do
    user = User.create(twitter_handle: "erintherad", full_name: nil)

    assert_equal false, user.valid?

    assert_equal "Full name can't be blank", user.errors.full_messages.first
  end
end
