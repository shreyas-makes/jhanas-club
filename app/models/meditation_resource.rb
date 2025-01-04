# app/models/meditation_resource.rb
class MeditationResource < ApplicationRecord
    # Validations
    validates_presence_of :title, :author, :description, :url
  
  
    # Scoping
    scope :published, -> { where(published: true) }  

    # Correctly define the enum with a prefix to avoid conflicts
    enum theme: {
        first_jhana: 0,
        second_jhana: 1,
        third_jhana: 2
    }, _prefix: :theme

    # Scope for filtering by themes
    scope :by_theme, ->(theme) {
        if theme.present? && theme.is_a?(Array)
        where("themes @> ARRAY[?]::varchar[]", theme)
        else
        all # Return all records if no valid theme is provided
        end
    }
    # For ActiveAdmin
    def self.ransackable_attributes(auth_object = nil)
      ["title", "author", "description", "url", "themes", "published", "created_at", "updated_at"]
    end
  
    def self.ransackable_associations(auth_object = nil)
      []
    end
  end