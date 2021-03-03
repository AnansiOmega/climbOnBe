class Notification < ApplicationRecord
  belongs_to :user
  scope :friend_requests, -> { where('notice_type = friendRequest')}
end
