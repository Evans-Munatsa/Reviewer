class Book < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "200x200>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  belongs_to :category
  has_many :rates
end
