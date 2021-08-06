FactoryBot.define do
  factory :order_address do
    token             {2}
    postal_code       {"123-4567"}
    delivery_id       {2}
    municipality      {"横浜市"}
    address           {"1-1"}
    phone_number      {"09012345678"}
  end

  before(:create) do |order_address|
    order_address.user_id = create(:user_id)
  end

  before(:create) do |order_address|
    order_address.item_id = create(:item_id)
  end
end
