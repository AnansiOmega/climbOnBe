class Notification < ApplicationRecord
  belongs_to :user
  scope :friend_requests, -> { where('notice_type = friendRequest')}
  scope :new_messages, -> { where('notice_type = newMessage')}
  scope :likes, -> { where('notice_type = like')}
  scope :comments, -> { where('notice_type = comment')}
end
