class AddAvatarPasswortToUsers < ActiveRecord::Migration
  def up
    add_attachment :users, :avatar
    add_attachment :users, :passport
  end

  def down
    remove_attachment :users, :avatar
    remove_attachment :users, :passport
  end
end
