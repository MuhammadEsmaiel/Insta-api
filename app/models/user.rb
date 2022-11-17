class User < ApplicationRecord
    validates_uniqueness_of :username
    validates :username, presence: true
	scope :all_except, ->(user) { where.not(id: user) }
	has_and_belongs_to_many :application
end