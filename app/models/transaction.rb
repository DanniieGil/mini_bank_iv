class Transaction < ApplicationRecord
  belongs_to :account

  validates :transaction_type, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
