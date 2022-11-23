class Application < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :chats, dependent: :destroy
    has_many :messages, dependent: :destroy
end
