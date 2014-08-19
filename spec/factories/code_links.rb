# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :code_link do
    link "MyString"
    project_id 1
    title "MyString"
  end
end
