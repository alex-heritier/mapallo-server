# frozen_string_literal: true

class CreateLogins < ActiveRecord::Migration[5.2]
  def change
    create_table :logins do |t|
      t.integer :user_id
      t.text :password_digest

      t.timestamps
    end
  end
end
