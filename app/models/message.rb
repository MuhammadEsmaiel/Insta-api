class Message < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :application
  belongs_to :chat
  validates_presence_of :content
  
  settings do
    mappings dynamic: false do
      indexes :content, type: :text
    end
  end
end
