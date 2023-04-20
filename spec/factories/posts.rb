FactoryBot.define do
  factory :post do
    content { "test" }
    post_image { Rack::Test::UploadedFile.new(File.join(Rails.root, "app/assets/images/default.png")) }
    association :user
  end
end
