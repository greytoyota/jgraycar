class Course < ActiveRecord::Base
  validates :title, presence: true
  validates :identifier, presence: true
end
