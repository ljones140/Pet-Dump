class AddPetIdToToilet < ActiveRecord::Migration
  def change
    add_reference :toilets, :pet, index: true, foreign_key: true
  end
end
