class AddTmpNicknameAndTmpAvatarToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :tmp_nickname, :string
    add_column :comments, :tmp_avatar, :string
  end
end
