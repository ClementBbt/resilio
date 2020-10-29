class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.float :price
      t.string :category
      t.string :periodicity
      t.boolean :commitment
      t.integer :notice
      t.references :user, null: false, foreign_key: true
      t.text :status

      t.timestamps
    end
  end
end
