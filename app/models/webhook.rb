class Webhook < ApplicationRecord
    validates :transaction_id, presence: true
end