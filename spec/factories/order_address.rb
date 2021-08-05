FactoryBot.define do
  factory :order_address do
    postal_code       {"123-4567"}
    delivery_id       {2}
    municipality      {"横浜市"}
    address           {"1-1"}
    phone_number      {"09012345678"}
  end
end
