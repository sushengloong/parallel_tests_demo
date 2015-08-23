class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :given_name
      t.string :family_name
      t.integer :age

      t.timestamps null: false
    end
  end
end
