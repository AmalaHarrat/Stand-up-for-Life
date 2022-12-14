class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :address
      t.string :city
      t.date :date
      t.integer :duration
      t.string :max_participant
      t.string :integer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
