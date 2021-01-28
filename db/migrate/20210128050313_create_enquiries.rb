class CreateEnquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :enquiries do |t|
      t.string :first_name
      t.string :last_name
      t.string :organisation
      t.string :email
      t.integer :phone_number
      t.text :description
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
