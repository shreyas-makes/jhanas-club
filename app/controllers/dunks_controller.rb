# app/controllers/dunks_controller.rb
class DunksController < ApplicationController
    def index
      @dunks = Dunk.published
      @dunks = @dunks.by_theme(params[:theme]) if params[:theme].present?
      @available_themes = Dunk::THEMES
    end
  end