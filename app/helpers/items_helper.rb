module ItemsHelper
  def find_item(s)
    Item.find_by(subcategory_id: [s])
  end
end
