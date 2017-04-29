class AddUserIdToGroupUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :group_users, :group, foreign_key: :true
    add_reference :group_users, :user, foreign_kay: :true
  end
end
