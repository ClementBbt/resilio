class Subscription < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  CATEGORIES = ['Streaming', 'Energie', 'Loisirs', 'Telecom', 'Divers']


  def limit_date
    self.end_date ? self.end_date - 30 : "Pas d'engagement"
  end

end

#faire un before save soit un validate, et appeler une methode qui fait que la sous a bien une category

