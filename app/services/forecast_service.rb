class ForecastService
  attr_reader :response, :city_id, :city_uid, :city_name
  # example: api.openweathermap.org/data/2.5/forecast?id=6695624&APPID=12121212121221212121212122121212
  ENDPOINT = 'api.openweathermap.org/data/2.5/forecast'.freeze

  def initialize(city)
    @city_id = city.id
    @city_uid = city.uid
    @city_name = city.name
    @response = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(fetch_data.body))
  end

  def fetch_data
    RestClient.get ENDPOINT, { params: { id: @city_uid, 'APPID' => ENV['OPEN_WEATHER_MAP_TOKEN'] } }
  end
end