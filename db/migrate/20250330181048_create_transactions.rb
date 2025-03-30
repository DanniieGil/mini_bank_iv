class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :transaction_type, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
