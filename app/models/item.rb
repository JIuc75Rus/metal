class Item < ApplicationRecord
  has_and_belongs_to_many :category
  has_attached_file :images, :path => ":rails_root/public/system/item/images/:id/:style/:filename",
                             :url => "/system/item/images/:id/:style/:filename"
  validates_attachment_content_type :images, content_type: ["image/jpeg", "image/gif", "image/png"]
end
