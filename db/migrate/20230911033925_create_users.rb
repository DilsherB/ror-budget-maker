class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.string :password_digest
      t.string :confirm_password_digest

      t.timestamps
    end
  end
end
