class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :email, null: false, default: ""
      t.string :phone, null: false, default: ""

      t.timestamps
    end
  end
end
