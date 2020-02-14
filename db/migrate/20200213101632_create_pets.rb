class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :kind
      t.integer :age_in_years

      t.timestamps
    end
  end
end
