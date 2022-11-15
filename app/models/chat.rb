class Chat < ApplicationRecord
  belongs_to :application
  has_many : messages
  validates_uniqueness_of :chat_no
end
