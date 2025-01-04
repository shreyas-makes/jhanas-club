# db/seeds.rb

# First, let's clear existing data to avoid duplicates
puts "Cleaning database..."
Dunk.destroy_all
User.destroy_all

# Create admin user
puts "Creating admin user..."
User.create!(
  email: 'admin@jhanas.club',
  password: 'password123',
  admin: true
)

# Create Dunks
puts "Creating dunks..."

# Helper method to get random themes
def random_themes
  # Get 1-3 random themes
  Dunk::THEMES.sample(rand(1..3))
end

# Create 20 dunks with varied data
20.times do |i|
  Dunk.create!(
    title: [
      "#{Faker::Ancient.god} Method of Meditation",
      "The #{Faker::Science.element} Practice",
      "#{Faker::Science.scientist}'s Guide to Jhana",
      "Mastering #{Faker::Hobby.activity} Mind",
      "The #{Faker::Company.buzzword.capitalize} Path to Jhana"
    ].sample,
    author: Faker::Name.name,
    description: Faker::Lorem.paragraph(sentence_count: 3, supplemental: true, random_sentences_to_add: 4),
    url: [
      "https://www.buddhanet.net/#{Faker::Internet.slug}",
      "https://www.accesstoinsight.org/#{Faker::Internet.slug}",
      "https://www.dhammatalks.org/#{Faker::Internet.slug}",
      "https://www.dharmaoverground.org/#{Faker::Internet.slug}"
    ].sample,
    themes: random_themes,
    published: [true, true, true, false].sample # 75% chance of being published
  )
end

puts "Created #{Dunk.count} dunks"
puts "Created #{User.count} users"
puts "Seeding completed!"