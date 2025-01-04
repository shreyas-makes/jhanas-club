# app/admin/dunks.rb
ActiveAdmin.register Dunk do
    menu priority: 2
  
    permit_params :title, :author, :description, :url, :published, themes: []
  
    index do
      selectable_column
      id_column
      column :title
      column :author
      column :themes
      column :published
      column :created_at
      actions
    end
  
    form do |f|
      f.inputs 'Entry Details' do
        f.input :title
        f.input :author
        f.input :description
        f.input :url
        f.input :themes, as: :select, collection: Dunk::THEMES, multiple: true
        f.input :published
      end
      f.actions
    end
  end