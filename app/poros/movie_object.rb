class MovieObject
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews,
              :image
  def initialize(movie)
    @title = movie[:title]
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @genres = movie[:genres]
    @overview = movie[:overview]
    @cast = movie[:credits][:cast]
    @reviews = movie[:reviews][:results]
    @image = movie[:images][:backdrops][0][:file_path]
  end

  def detail_genres
    @genres.each_with_object([]) {|genre,array| array << genre[:name]}
  end

  def detail_cast
    @cast.each_with_object({}) do |cast,hash|
      name = cast[:name]
      if !(hash.count == 10)
        if hash[name]
          hash[name] << ",#{cast[:character]}"
        else
          hash[name] = "#{cast[:character]}"
        end
      end
    end
  end

  def detail_runtime
    hours = @runtime/60
    mins = @runtime % 60
    if hours == 0
      "#{mins} min"
    else
     "#{hours}hr #{mins} min"
    end
  end
end
