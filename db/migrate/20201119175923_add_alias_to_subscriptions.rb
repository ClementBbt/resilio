class AddAliasToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :alias, :string
  end
end
