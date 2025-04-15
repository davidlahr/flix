class ReviewsController < ApplicationController
  before_action :require_signin, except:[:index, :show]
  before_action :set_movie
  
  def index
    @movie = Movie.find_by!(slug: params[:movie_id])
    @reviews = @movie.reviews    
  end

  def show
    
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to movie_reviews_url(@movie), notice: "Successful!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    
    @movie.reviews.find(params[:id]).destroy
    redirect_to movie_reviews_url, method: :get, status: :see_other, alert: "Review successfully deleted"
  end

  private

  def review_params
    params.require(:review).permit(:stars, :comment)
  end

  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_id])
  end

  


end
