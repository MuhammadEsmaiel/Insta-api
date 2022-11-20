class CreatChat < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :noOfChat
      t.timestamps
      t.references :applications, null: false, foreign_key: true
    end
  end
end