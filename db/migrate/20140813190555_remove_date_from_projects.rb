class RemoveDateFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :date, :date
  end
end
