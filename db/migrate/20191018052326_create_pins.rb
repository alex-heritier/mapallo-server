# frozen_string_literal: true

class CreatePins < ActiveRecord::Migration[5.2]
  def change
    create_table :pins do |t|
      t.integer :user_id
      t.float :lat
      t.float :lng
      t.text :pinnable_type
      t.integer :pinnable_id

      t.timestamps
    end

    add_index :pins, :user_id
  end
end
