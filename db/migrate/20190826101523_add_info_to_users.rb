class AddInfoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :skill_want, :string
    add_column :users, :skill_want_level, :integer
    add_column :users, :skill_want_description, :text
    add_column :users, :skill_teach, :string
    add_column :users, :skill_teach_level, :integer
    add_column :users, :skill_teach_description, :text
  end
end
