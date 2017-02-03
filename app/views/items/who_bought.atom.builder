atom_feed do |feed|
  feed.title "Who bought #{@item.title}"
  feed.updated @latest_order.try(:updated_at)
  @item.orders.each do |order|
    feed.entry(order) do |entry|
      entry.title "Order #{order.id}"
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.p "Shipped to #{order.message}"
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Product'
            xhtml.th 'Quantity'
            xhtml.th 'Total Price'
          end
          order.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.item.title
              xhtml.td item.quantity
            end
          end
        end
      end
    end
  end
end