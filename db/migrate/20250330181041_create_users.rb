class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :identification, null: false
      t.string :names, null: false
      t.string :type, null: false
      t.decimal :salary, precision: 10, scale: 2

      t.timestamps
    end

    add_index :users, :identification, unique: true
  end
end
