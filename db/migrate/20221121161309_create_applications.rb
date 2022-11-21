class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.integer :chat_cont
      t.integer :msg_cont

      t.timestamps
    end
  end
end
