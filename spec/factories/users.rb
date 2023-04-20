FactoryBot.define do
  factory :user do
    name {"test"}
    email {"test@gmail.com"}
    password {"12345678"}
    password_confirmation {"12345678"}
    gender {"男性"}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, "app/assets/images/default.png")) }
  end
end
