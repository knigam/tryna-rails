class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :activity_id
      t.integer :user_id
      t.string :text

      t.timestamps null: false
    end
  end
end
