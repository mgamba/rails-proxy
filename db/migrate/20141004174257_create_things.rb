class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.text :value
    end
  end
end
