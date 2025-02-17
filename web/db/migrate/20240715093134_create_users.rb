# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def self.up
    create_table :users do |t|
      t.bigint :shopify_user_id, null: false
      t.string :shopify_domain, null: false
      t.string :shopify_token, null: false
      t.timestamps
    end

    add_index :users, :shopify_user_id, unique: true
  end

  def self.down
    drop_table :users
  end
end
