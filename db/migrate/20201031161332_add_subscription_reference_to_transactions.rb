class AddSubscriptionReferenceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :subscription, index: true, null: true
  end
end
