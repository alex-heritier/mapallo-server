# frozen_string_literal: true

class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.integer :user_id
      t.text :value

      t.timestamps
    end

    add_index :tokens, :user_id
  end
end
