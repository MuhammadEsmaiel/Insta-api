class Message < ApplicationRecord
  belongs_to :application
  belongs_to :chat
end
