FactoryBot.define do
  factory :spot do
    title { "testtitle" }
    address { "test" }
    spot_image { Rack::Test::UploadedFile.new(File.join(Rails.root, "app/assets/images/default.png")) }
    content { "test" }
    association :user
  end
end
