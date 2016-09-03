class AddDefaultValueToVerified < ActiveRecord::Migration
  def change
    change_column :users, :verified, :boolean, :default => false
  end
end
