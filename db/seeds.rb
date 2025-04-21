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

# Create dunks with static data
titles = [
  "Vipassana Method of Meditation",
  "The Breath Practice",
  "Buddha's Guide to Jhana",
  "Mastering Mindful Mind",
  "The Insight Path to Jhana"
]

authors = [
  "Joseph Goldstein",
  "Jack Kornfield",
  "Sharon Salzberg",
  "Bhante Gunaratana",
  "Daniel Ingram"
]

descriptions = [
  "A comprehensive guide to reaching the first jhana through breath meditation techniques.",
  "This resource explains how to work with physical sensations as objects of meditation.",
  "An in-depth exploration of the jhanas with practical instructions for attainment.",
  "A practical guide to establishing a daily meditation practice targeting jhana states.",
  "Modern perspectives on traditional concentration practices leading to jhana."
]

urls = [
  "https://www.buddhanet.net/jhana-guide",
  "https://www.accesstoinsight.org/meditation-manual",
  "https://www.dhammatalks.org/jhana-practice",
  "https://www.dharmaoverground.org/concentration-states"
]

20.times do |i|
  Dunk.create!(
    title: titles.sample,
    author: authors.sample,
    description: descriptions.sample,
    url: urls.sample,
    themes: random_themes,
    published: [true, true, true, false].sample # 75% chance of being published
  )
end

puts "Created #{Dunk.count} dunks"
puts "Created #{User.count} users"
puts "Seeding completed!"