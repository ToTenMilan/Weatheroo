class UserCitiesController < ApplicationController
  def index
    @city = City.search(params[:search])
  end

  def new
    # @cities = City.pluck(:id, :name).map { |city| { city[0] => city[1] } }
    city = City.search(params[:search])
    @forecast = ForecastService.new(city)
  end

  def create
  end
end
