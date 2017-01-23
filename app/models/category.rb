class Category < ApplicationRecord
  has_many :items
  has_attached_file :images, :path => ':rails_root/public/system/category/images/:id/:style/:filename',
                             :url => '/system/category/images/:id/:style/:filename'
  validates_attachment_content_type :images, content_type: ["image/jpeg", "image/gif", "image/png"]
  extend FriendlyId
  friendly_id :url, use: :slugged
end