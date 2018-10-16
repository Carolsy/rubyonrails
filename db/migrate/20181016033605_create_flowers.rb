class CreateFlowers < ActiveRecord::Migration
  def change
    create_table :flowers do |t|
      t.integer :article_id
    end
  end
end
