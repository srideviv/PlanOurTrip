class AddFuidToTourist < ActiveRecord::Migration
  def change
    add_column :tourists, :fuid, :string
  end
end
