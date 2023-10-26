FactoryBot.define do
  factory :comment do
    content {Faker::Lorem.sentence}
    factory :comment_with_parent, parent: :comment do
      parent { create(:comment) } # 親コメントを生成して関連付ける
    end
    association :user
    association :anime
  end
end
