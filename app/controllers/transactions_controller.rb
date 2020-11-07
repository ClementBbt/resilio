class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all.group_by{|t|t.title}
  end

end
