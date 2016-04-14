class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :password_confirmation
      t.integer :role
      t.integer :unspent_points
      t.integer :spent_points
    end
  end
end
