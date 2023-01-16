class AddSomecolumnsToTemplate < ActiveRecord::Migration[7.0]
  def change
    add_column :templates, :header, :json
    add_column :templates, :footer, :json
    add_column :templates, :is_template, :boolean, default: false
  end
end
