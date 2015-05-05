class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.integer :activity_id
      t.boolean :attending, :null => false, :defualt => false
      t.boolean :creator, :null => false, :default => false

      t.timestamps null: false
    end
  end
end
