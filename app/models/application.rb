class Application < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :name
  validates :name, presence: true
  has_many :chats
  has_many :messages
  #self.primary_key = "token"
end
