class ChangeUsernameInUsers < ActiveRecord::Migration
  def change
    change_column :users, :username, :string, null: false, default: ""
  end
end
