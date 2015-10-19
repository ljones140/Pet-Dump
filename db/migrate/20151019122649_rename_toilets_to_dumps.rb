class RenameToiletsToDumps < ActiveRecord::Migration
  def change
    rename_table :toilets, :dumps
  end
end
