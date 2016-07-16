class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.float :critical_sum
      t.boolean :notify

      t.timestamps null: false
    end
  end
end
