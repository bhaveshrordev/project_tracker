# spec/factories/activities.rb
FactoryBot.define do
  factory :activity do
    kind { "comment" }
    content { "Sample content" }
    association :user
    association :project
  end
end
