class CreateFilters < ActiveRecord::Migration[6.0]
  def change
    create_table :filters do |t|
      t.string :industry
      t.string :position

      t.timestamps
    end
  end
end
