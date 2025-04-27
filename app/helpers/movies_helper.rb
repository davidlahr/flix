module MoviesHelper

  def nice_date(movie)
    movie.release_date.strftime("%B %d, %Y")
  end

  def total_gross(movie)
    if movie.flop?
      "Flop"
    else
      number_to_currency(movie.total_gross, precision:0)
    end
  end

  def average_stars(movie)
    if movie.average_review == 0
      "No Reviews"  
    else
      render "shared/stars", percent: @movie.average_review
    end
    
  end

  def main_image(movie)
    if movie.main_image.attached?
      image_tag movie.main_image
    else
      image_tag "placeholder.png" 
    end
  end

end
