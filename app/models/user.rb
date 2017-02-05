class User < ApplicationRecord
  validates :twitter_handle, presence: true, uniqueness: true
  validates :full_name, presence: true
end
