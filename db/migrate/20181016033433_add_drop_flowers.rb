class AddDropFlowers < ActiveRecord::Migration
  def change
    drop_table :flowers
  end
end
