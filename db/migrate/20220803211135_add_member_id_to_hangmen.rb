class AddMemberIdToHangmen < ActiveRecord::Migration[6.0]
  def change
    add_column :hangmen, :member_id, :integer
  end
end
