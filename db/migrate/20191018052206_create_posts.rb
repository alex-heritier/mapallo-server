# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :title
      t.text :text

      t.timestamps
    end

    add_index :posts, :user_id
  end
end
