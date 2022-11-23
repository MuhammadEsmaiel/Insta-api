class AddMsgNoToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :msg_no, :integer
  end
end
