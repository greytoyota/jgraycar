class CreateCodeLinks < ActiveRecord::Migration
  def change
    create_table :code_links do |t|
      t.string :link
      t.integer :project_id
      t.string :title

      t.timestamps
    end
  end
end
