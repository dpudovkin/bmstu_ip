class CreateNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :numbers do |t|
      t.numeric :num
      t.string :result

      t.timestamps
    end
    add_index :numbers, :num, unique: true
  end
end
