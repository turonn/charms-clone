class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.boolean :email_verified
      t.string :mobile_phone_number
      t.date :birthday

      t.timestamps
    end
  end
end
