class AddDescriptionToCodeLinks < ActiveRecord::Migration
  def change
    add_column :code_links, :description, :text
  end
end
