class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.string :identifier
      t.string :link

      t.timestamps
    end
  end
end
