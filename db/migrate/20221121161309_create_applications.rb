class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.integer :chat_cont
      t.integer :msg_cont

      t.timestamps
    end
    execute("ALTER TABLE applications AUTO_INCREMENT = 551")
  end
end
