class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments, id: :uuid do |t|
      t.string :case_id
      t.string :instrument
      t.string :make
      t.string :model
      t.string :serial_number
      t.integer :year
      t.string :condition
      t.text :notes
      t.uuid :program_id, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
