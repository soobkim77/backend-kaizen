class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :due_date
      t.text :description
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end