class Subscription < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy

  def limit_date
    self.end_date ? self.end_date - 30 : "Pas d'engagement"
  end

end

