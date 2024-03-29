class CreateImportedData < ActiveRecord::Migration[7.0]
  def change
    create_table :imported_data do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
