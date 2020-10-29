class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.text :title
      t.text :reference
      t.date :date
      t.float :amount
      t.references :subscription, null: false, foreign_key: true
      t.references :bank_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
