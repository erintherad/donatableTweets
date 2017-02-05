class Pledge < ApplicationRecord
  validates :dollars_per_tweet, presence: true
  validates :user_id, presence: true

  belongs_to :user
end
