FactoryBot.define do
  factory :activity do
    kind { "MyString" }
    content { "MyText" }
    user { nil }
    project { nil }
  end
end
