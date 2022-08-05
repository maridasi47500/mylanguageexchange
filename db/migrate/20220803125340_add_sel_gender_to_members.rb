class AddSelGenderToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :selGender, :string
  end
end
