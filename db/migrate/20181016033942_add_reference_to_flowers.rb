class AddReferenceToFlowers < ActiveRecord::Migration
  def change
    add_reference(:flowers, :articles, foreign_key: true)
  end
end
