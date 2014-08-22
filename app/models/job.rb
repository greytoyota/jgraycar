class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :start_date, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
