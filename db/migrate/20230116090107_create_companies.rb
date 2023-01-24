class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :description
      t.string :email, index: { unique: true, name: 'unique_emails' }
      t.string :password

      t.timestamps
    end
  end
end
