class PaymentForm
  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'は11桁以内の数字（ハイフン不要）で入力してください' }
    validates :token, presence: { message: 'can\'t be blank' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(
      postal_code: postal_code, prefecture: prefecture_id,
      city: city, addresses: addresses, building: building,
      phone_number: phone_number, order_id: order.id
    )
  end
end
