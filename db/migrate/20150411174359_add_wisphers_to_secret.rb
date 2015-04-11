class AddWisphersToSecret < ActiveRecord::Migration
  def change
    add_column :secrets, :whispers, :integer
  end
end
