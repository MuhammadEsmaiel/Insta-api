class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :msg_number
      t.string :text
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
