class Application < ApplicationRecord
  has_and_belongs_to_many :user
  validates_uniqueness_of :token
  has_many :chats
end
