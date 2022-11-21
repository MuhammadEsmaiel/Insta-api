class Application < ApplicationRecord
    validates_uniqueness_of :name
    validates :name, presence: true
    has_many :chats, dependent: :destroy
    has_many :messages, dependent: :destroy
end
