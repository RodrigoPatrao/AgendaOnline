class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :contactName
      t.string :contactEmail
      t.string :contactPhone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
