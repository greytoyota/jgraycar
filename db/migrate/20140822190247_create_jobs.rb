class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :location
      t.string :start_date
      t.string :end_date
      t.text :description

      t.timestamps
    end
  end
end
