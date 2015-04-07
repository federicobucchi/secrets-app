class AddActiveToSecret < ActiveRecord::Migration
  def change
    add_column :secrets, :active, :boolean
  end
end
