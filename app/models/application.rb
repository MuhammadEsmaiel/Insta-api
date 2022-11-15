class Application < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :token
  has_many :chats
end
