# frozen_string_literal: true
class AddAffinityToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_column :visitors, :affinity, :string
  end
end
