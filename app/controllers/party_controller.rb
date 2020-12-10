class PartyController < ApplicationController

  def new
    @movie = SearchFacade.movie_info(params[:movie_id])
  end

  def create
    movie = Movie.create!(title: params[:movie_title], api_id: params[:movie_id], duration: params[:duration_of_party])
    movie_party = MovieParty.create!(movie_id: movie.id, user_id: current_user.id, date: params[:date], time: params[:start_time])
    PartyGuest.add_party_guest(params[:invite_friends], movie_party)
    redirect_to "/dashboard"
  end
end
