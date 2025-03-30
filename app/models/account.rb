class Account < ApplicationRecord
  belongs_to :client
  has_many :transactions, dependent: :destroy

  validates :account_type, presence: true
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }

  def show_details
    "[#{account_type.upcase}] - Saldo: $#{balance}"
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      save
      "Depósito de $#{amount} exitoso! Nuevo saldo: $#{balance}"
    else
      "Error: La cantidad a depositar debe ser mayor a $0"
    end
  end

  def withdraw(amount)
    if amount > 0 && amount <= balance
      self.balance -= amount
      save
      "Retiro de $#{amount} exitoso! Nuevo saldo: $#{balance}"
    else
      "Error: Fondos insuficientes o monto erróneo."
    end
  end
end
