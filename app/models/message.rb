class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :application
  validates_presence_of :text
end
