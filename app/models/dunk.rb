# app/models/dunk.rb
class Dunk < ApplicationRecord
    validates_presence_of :title, :author, :description
    validates :url, presence: true, url: { allow_blank: false, no_local: true }
  
    serialize :themes, coder: YAML
  
    # Define scopes properly
    scope :published, -> { where(published: true) }
    scope :by_theme, ->(theme) { where("themes LIKE ?", "%#{theme}%") if theme.present? }
  
    # Themes for jhana meditation practices
    THEMES = [
      'Books',
      'Articles', 
      'Social forums',
      'PDF',
      'Podcasts',
      'Videos'
    ]
  
    # For ActiveAdmin
    def self.ransackable_attributes(auth_object = nil)
      ["title", "author", "description", "url", "themes", "published", "created_at", "updated_at"]
    end
  
    # Ensure themes is always an array
    def themes
      super || []
    end
  end