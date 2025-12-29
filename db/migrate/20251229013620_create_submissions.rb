class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.text :content
      t.references :assignment, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
