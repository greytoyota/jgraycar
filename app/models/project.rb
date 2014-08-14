class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  validates :title, presence: true
  validates :description, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 2012,
  less_than_or_equal_to: Time.now.year }

  Paperclip.interpolates :slug do |attachment, style|
    attachment.instance.slug
  end

  has_attached_file :icon, :styles => { thumb: "200x200#" },
  path: "/projects/:slug/:attachment/:style/:filename",
  url: "/projects/:slug/:attachment/:style/:filename",
  default_url: "/images/projects/:attachment/:style/missing.png"
  include DeletableAttachment
  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\Z/

  def slug_candidates
    [
     :title,
     [:title, :year]
    ]
  end
end
