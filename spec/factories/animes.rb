FactoryBot.define do
  factory :anime do
    title {Faker::Lorem.sentence}
    synopsis {Faker::Lorem.sentence}
    genre_id {1}
    good_point_id {1}
    recommendation_id {1}
    text {Faker::Lorem.sentence}
    association :user

    after(:build) do |anime|
      anime.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
