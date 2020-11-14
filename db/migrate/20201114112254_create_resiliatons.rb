class CreateResiliatons < ActiveRecord::Migration[6.0]
  def change
    create_table :resiliations do |t|
      t.string :from_last_name
      t.string :from_first_name
      t.string :from_email
      t.string :from_subscription_reference
      t.string :to_name

      t.timestamps
    end
  end
end
