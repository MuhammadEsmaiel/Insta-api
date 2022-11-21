class CreatApplication < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.integer :chat_no
      t.integer :msg_no
      t.timestamps
    end
    execute("ALTER TABLE applications AUTO_INCREMENT = 5011")
  end
end
