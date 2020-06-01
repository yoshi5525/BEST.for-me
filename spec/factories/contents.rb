FactoryBot.define do
  factory :content do
    id         {1}
    product    {"mac book"}
    body       {"使いやすい"}
    image      {File.open("#{Rails.root}/public/images/test_image.jpg")}
    link       {"https://www.apple.com/jp/mac/"}
    user_id    {1}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end