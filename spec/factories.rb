FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "email#{n}@example.com" }
    password "password"
    first_name "Joe"
    last_name "Shmoe"
    display_name "Mr.Shmoe"
    role "teacher"
  end

  factory :course do
    title "Algebra"
    description "Best course ever!"

    user
  end
end
