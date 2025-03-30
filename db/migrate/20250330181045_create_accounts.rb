class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :account_type, null: false
      t.decimal :balance, precision: 10, scale: 2, default: 0, null: false
      t.references :client, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
