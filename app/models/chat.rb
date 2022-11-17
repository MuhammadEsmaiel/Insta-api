class Chat < ApplicationRecord
  has_many :messages
  validates_uniqueness_of :chat_no
  belongs_to :application
end
