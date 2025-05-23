# spec/factories/projects.rb
FactoryBot.define do
  factory :project do
    name { "Test Project" }
    status { :pending }
    association :user
  end
end