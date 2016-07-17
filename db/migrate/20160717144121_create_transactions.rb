class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.float :sum
      t.references :category, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
