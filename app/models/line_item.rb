class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  belongs_to :cart
end
