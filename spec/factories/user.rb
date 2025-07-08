FactoryBot.define do
  factory :member, class: 'User::Member' do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :admin, class: 'User::Admin' do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end