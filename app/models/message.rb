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
  def self.search_msg(query)
    self.search({
      query: {
        bool: {
          must: [
          {
            multi_match: {
              query: query,
              fields: [:content]
            }
          }]
        }
      }
    })
  end
end
