class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :title
      t.text :description
      t.references :teacher, null: false, foreign_key: {to_table: :users}
      t.references :student, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
