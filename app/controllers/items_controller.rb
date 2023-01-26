class ItemsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  def index
    if params[:user_id]
      user = User.find(params[:user_id])
      items = user.items
    else
      items = Item.all
    end
    render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  def create
    user = User.find(params[:user_id])
    item = user.items.create!(item_params)
    render json: item, status: :created
  end

  private

  def item_params
    params.permit(:name, :description, :price)
  end

  def record_not_found(error)
    render json: { error: "#{error.model} not found" }, status: :not_found
  end

  def invalid_record(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

end