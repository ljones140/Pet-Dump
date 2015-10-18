class CreateToilets < ActiveRecord::Migration
  def change
    create_table :toilets do |t|
      t.datetime :time_went

      t.timestamps null: false
    end
  end
end
