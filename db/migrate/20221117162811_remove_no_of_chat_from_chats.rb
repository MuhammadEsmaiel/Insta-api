class RemoveNoOfChatFromChats < ActiveRecord::Migration[7.0]
  def change
    remove_column :chats, :noOfChat, :integer
  end
end
