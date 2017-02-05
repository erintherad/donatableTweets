require 'test_helper'

class PledgeTest < ActiveSupport::TestCase
  test "dollars_per_tweet must have a value" do
    pledge = Pledge.create(dollars_per_tweet: nil, user_id: 1)

    assert_equal false, pledge.valid?

    assert_equal "Dollars per tweet can't be blank", pledge.errors.full_messages.first
  end

  test "user_id must have a value" do
    pledge = Pledge.create(dollars_per_tweet: 1, user_id: nil)

    assert_equal false, pledge.valid?

    assert_equal "User can't be blank", pledge.errors.full_messages.first
  end

  test "pledge belongs_to user" do
    user = User.create
    pledge = Pledge.create(dollars_per_tweet: 1, user_id: user.id)

    assert_equal user, pledge.user
  end
end
