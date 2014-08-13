class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  validates :title, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greather_than: 2012 }

  def slug_candidates
    [
     :title,
     [:title, :year]
    ]
  end
end
