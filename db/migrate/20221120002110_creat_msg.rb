class CreatMsg < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :msg_number
      t.text :text
      t.references :applications, null: false, foreign_key: true
      t.references :chats, null: false, foreign_key: true
      t.timestamps
    end
  end
end