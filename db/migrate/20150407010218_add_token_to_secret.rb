class AddTokenToSecret < ActiveRecord::Migration
  def change
    add_column :secrets, :token, :string
  end
end
