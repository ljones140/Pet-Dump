class AddUserIdToPet < ActiveRecord::Migration
  def change
    add_reference :pets, :user, index: true, foreign_key: true
  end
end
