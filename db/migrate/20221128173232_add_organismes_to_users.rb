class AddOrganismesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :organisme, :boolean
  end
end
