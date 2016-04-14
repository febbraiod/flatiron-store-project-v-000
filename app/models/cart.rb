class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    line_items.each do |i|
      total += i.item.price.to_f * i.quantity
    end
    total
  end

  def add_item(item_id)
    if line_item = self.line_items.find_by(item_id: item_id)
      line_item.quantity += 1
      line_item
    else
      LineItem.new(cart_id: self.id, item_id: item_id, quantity: 1)
    end
  end

  def checkout
    line_items.each do |l|
      item = Item.find_by(id: l.item_id)
      item.inventory -= l.quantity
      item.save
    end
    self.status = 'submitted'
  end

end

