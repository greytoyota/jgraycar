class AddAttachmentIconToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :icon
    end
  end

  def self.down
    remove_attachment :projects, :icon
  end
end
