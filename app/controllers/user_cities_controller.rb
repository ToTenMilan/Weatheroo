class UserCitiesController < ApplicationController
  def show
    city = UserCity.find(params[:id]).city
    @forecast = ForecastService.new(city)
  end

  def new
    city = City.search(params[:search]) if params[:search]
    @forecast = ForecastService.new(city) if city
  end

  def create
    user_city = current_user.user_cities.new(user_city_params)
    if user_city.save
      redirect_to root_url, notice: "You have added #{user_city.city.name} to you cities list"
    else
      flash.now.alert = "Something went wrong. City not added"
      render 'new'
    end
  end

  private

  def user_city_params
    params.require(:user_city).permit(:uid, :city_id)
  end
end
