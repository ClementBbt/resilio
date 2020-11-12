class AddVisibleToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :visible, :boolean
  end
end
