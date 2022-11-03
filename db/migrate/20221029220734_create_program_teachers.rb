class CreateProgramTeachers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :programs, :teachers, column_options: {type: :uuid} do |t|
      t.timestamps
    end
  end
end
