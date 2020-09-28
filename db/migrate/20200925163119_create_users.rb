class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.boolean :status, default: true
      t.string :name
      t.string :email
      t.string :password
      t.timestamps
    end
  end
end
