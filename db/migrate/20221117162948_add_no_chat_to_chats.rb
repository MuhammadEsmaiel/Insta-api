class AddNoChatToChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :no_chat, :string
  end
end
