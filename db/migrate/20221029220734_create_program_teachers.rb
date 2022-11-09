class CreateProgramTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :program_teachers, id: :uuid do |t|
      t.uuid :program_id, index: true, foreign_key: true, null: false
      t.uuid :teacher_id, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
