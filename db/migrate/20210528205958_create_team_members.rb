class CreateTeamMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :team_members do |t|
      t.belongs_to :member
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
