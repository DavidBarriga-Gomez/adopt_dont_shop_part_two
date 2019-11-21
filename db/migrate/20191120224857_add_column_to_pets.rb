class AddColumnToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :description, :string
    add_column :pets, :status, :string, default: 'adoptable'
  end
end
