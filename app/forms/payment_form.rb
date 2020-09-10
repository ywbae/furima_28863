class PaymentForm

  include ActiveModel::Model  
  attr_accessor :user_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :order_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'は11桁以内の数字（ハイフン不要）で入力してください' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping_addresses.create(
      postal_code: postal_code, prefecture_id: prefecture_id,
      city: city, addresses: addresses, building: building,
      phone_number: phone_number
    )
  end
end