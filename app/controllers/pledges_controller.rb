class PledgesController < ApplicationController
  def create
    pledge = Pledge.create!(
      dollars_per_tweet: params[:dollars_per_tweet],
      max_per_month: params[:max_per_month],
      user_id: current_user.id
    )

    render json: pledge
  end

  def index
    pledges = Pledge.all

    render json: pledges
  end

  def show
    pledge = Pledge.find(params[:id])

    render json: pledge
  end

  def update
    pledge = Pledge.find(params[:id])

    update_params = params.permit(:dollars_per_tweet, :max_per_month)

    pledge.update_attributes!(update_params)

    render json: pledge
  end

  def destroy

  end
end
