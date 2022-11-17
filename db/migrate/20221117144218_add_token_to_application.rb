class AddTokenToApplication < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :token, :string
  end
end
