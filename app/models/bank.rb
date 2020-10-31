class Bank < ApplicationRecord
  belongs_to :user
  has_many :bank_accounts, dependent: :destroy
end
