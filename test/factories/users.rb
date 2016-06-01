FactoryGirl.define do
  factory :user do
    email "farmer@email.com"
    password "MyPassword"
    password_confirmation "MyPassword"
    access_token "S3cr3tT0k3N"
  end
end
