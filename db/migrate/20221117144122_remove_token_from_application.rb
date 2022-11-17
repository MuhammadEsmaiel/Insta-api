class RemoveTokenFromApplication < ActiveRecord::Migration[7.0]
  def change
    remove_column :applications, :token, :integer
  end
end
