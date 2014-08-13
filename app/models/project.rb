class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  validates :title, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 2012,
  less_than_or_equal_to: Time.now.year }

  def slug_candidates
    [
     :title,
     [:title, :year]
    ]
  end
end
