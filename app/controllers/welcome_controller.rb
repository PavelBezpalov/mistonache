class WelcomeController < ApplicationController

  before_action :gallery

  def home
    @announcements = Announcement.order(visits: :desc).limit(4).all
  end

  private

  def gallery
    @gallery = Gallery.find(1)
  end

end
