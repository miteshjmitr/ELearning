class AddGradeToSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :grade, :string
  end
end
