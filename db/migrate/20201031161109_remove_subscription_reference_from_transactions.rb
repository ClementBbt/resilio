class RemoveSubscriptionReferenceFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :transactions, :subscription
  end
end
