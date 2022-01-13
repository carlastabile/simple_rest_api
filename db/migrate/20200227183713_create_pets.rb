class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :kind
      t.integer :age_in_years
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
