FactoryBot.define do
  
  factory :item do
    product_name          {"名前"}
    description           {"説明"}
    price           {2000}
    category_id        {2}
    status_id          {2}
    burden_id          {2}
    delivery_id        {2}
    days_delivery_id   {2}
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
