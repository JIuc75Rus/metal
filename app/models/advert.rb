class Advert < ApplicationRecord
  has_attached_file :images, :path => ':rails_root/public/system/category/images/:id/:style/:filename',
                    :url => '/system/category/images/:id/:style/:filename'
  validates_attachment_content_type :images, content_type: ["image/jpeg", "image/gif", "image/png"]
end
