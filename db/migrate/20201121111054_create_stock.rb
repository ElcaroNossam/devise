class CreateStock < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks do |t|
      t.integer :user_id
      t.string :content
    end
  end
end
