class AddColorToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :color, :string
  end
end
