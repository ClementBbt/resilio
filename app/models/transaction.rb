class Transaction < ApplicationRecord
  belongs_to :subscription, optional: true
  belongs_to :bank_account
end
