class CreateDealers < ActiveRecord::Migration[8.0]
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :level
      
      t.timestamps
    end
  end
end
