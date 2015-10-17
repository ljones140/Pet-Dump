class RemoveAnimalFromPet < ActiveRecord::Migration
  def change
    remove_column :pets, :animal, :string
  end
end
