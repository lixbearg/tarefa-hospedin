class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true, index: true
      t.integer :status
      t.string :name
      t.text :description
      t.date :due_at
      t.integer :priority
      t.timestamps
    end
  end
end
