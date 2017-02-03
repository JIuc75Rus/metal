class Item < ApplicationRecord
  belongs_to :itemscategory
  has_many :line_items
  has_many :orders, through: :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  #...
  private
  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end
  has_attached_file :images, :path => ':rails_root/public/system/category/images/:id/:style/:filename',
                    :url => '/system/category/images/:id/:style/:filename'
  validates_attachment_content_type :images, content_type: ["image/jpeg", "image/gif", "image/png"]
end
