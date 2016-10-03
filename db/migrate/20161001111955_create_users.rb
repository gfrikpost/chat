class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.string :password_digest, null: false
      t.timestamps null: false
    end
  end
end
