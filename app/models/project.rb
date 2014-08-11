class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

  def slug_candidates
    [
     :title,
     [:title, :date]
    ]
  end
end
