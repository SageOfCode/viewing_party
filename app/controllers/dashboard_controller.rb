class DashboardController < ApplicationController
  def index
    # require 'pry'; binding.pry
    @friends = current_user.friends
    @movie_parties = current_user.movie_parties
  end
end
