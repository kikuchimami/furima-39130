class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_area_id, :city, :street_address, :building_name, :phone_number, :user_id, :token, :item_id

  with_options presence: true do
    validates :item_id
    validates :city
    validates :street_address
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: '○:123-4567 ×:1234567' }
    validates :user_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '半角数字で入れてください。○:09012345678  ×:090-1234-5678'}
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: 'can not be blank' }
  
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, shipping_area_id: shipping_area_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, order: order )
  end
end


