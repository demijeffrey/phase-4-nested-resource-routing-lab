class UsersController < ApplicationController

  # def show
  #   user = User.find_by(id: params[:id])
  #   render json: user, include: :items
  # end

  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

end



# def index
#   if params[:dog_house_id]
#     dog_house = DogHouse.find(params[:dog_house_id])
#     reviews = dog_house.reviews
#   else
#     reviews = Review.all
#   end
#   render json: reviews, include: :dog_house
# end