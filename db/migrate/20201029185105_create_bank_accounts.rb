class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.string :name
      t.references :bank, null: false, foreign_key: true

      t.timestamps
    end
  end
end
