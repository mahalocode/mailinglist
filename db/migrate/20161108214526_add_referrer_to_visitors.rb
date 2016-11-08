class AddReferrerToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :referrer, :string
  end
end
