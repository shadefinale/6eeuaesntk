# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "MyString"
    email "MyString"
    password "Foobar"
    password_confirmation "Foobar"
  end
end
