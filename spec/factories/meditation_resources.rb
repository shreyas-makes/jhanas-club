FactoryBot.define do
  factory :meditation_resource do
    title { "MyString" }
    author { "MyString" }
    description { "MyText" }
    url { "MyString" }
    resource_type { "MyString" }
    themes { "MyString" }
    published { false }
  end
end
