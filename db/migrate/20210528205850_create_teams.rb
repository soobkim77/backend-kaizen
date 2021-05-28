class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.belongs_to :leader
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
