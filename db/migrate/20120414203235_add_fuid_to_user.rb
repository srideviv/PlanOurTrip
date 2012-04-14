class AddFuidToUser < ActiveRecord::Migration
  def change
    add_column :users, :fuid, :string
  end
end
