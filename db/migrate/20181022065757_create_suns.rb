class CreateSuns < ActiveRecord::Migration[5.0]
  def change
    create_table :suns do |t|
      t.string :head_name
      t.string :tail_name
      t.timestamps
    end
  end
end
