class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :token
      t.string :name
      t.integer :chat_no
      t.integer :msg_no
      t.timestamps
    end
  end
end
