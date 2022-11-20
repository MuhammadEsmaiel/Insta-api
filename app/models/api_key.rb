require 'securerandom'
class ApiKey < ApplicationRecord
before_create :generate_token

    def generate_token
        self.access_token=SecureRandom.hex(10)
    end
  end
end
