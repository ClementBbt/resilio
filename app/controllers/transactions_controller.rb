class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.where(subscription: nil).group_by{|t|t.title}

  end

end
