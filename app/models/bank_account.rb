class BankAccount < ApplicationRecord
  belongs_to :bank
  has_many :transactions
end
