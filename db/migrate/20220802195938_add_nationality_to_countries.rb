class AddNationalityToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :nationality, :string
  end
end
