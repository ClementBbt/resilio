class Transaction < ApplicationRecord
  belongs_to :subscription
  belongs_to :bank_account
end
