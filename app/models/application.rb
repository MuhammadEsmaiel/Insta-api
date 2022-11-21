class Application < ApplicationRecord
    has_many :chats
    has_many :messages
end
