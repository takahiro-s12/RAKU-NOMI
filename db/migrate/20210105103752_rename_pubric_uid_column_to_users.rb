class RenamePubricUidColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :pubric_uid, :public_uid
  end
end
