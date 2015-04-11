class AddTimeToSecret < ActiveRecord::Migration
  def change
    add_column :secrets, :time, :integer
  end
end
