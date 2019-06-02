class ForecastService
  attr_reader :response, :uid, :city_name
  # example endpoint api.openweathermap.org/data/2.5/forecast?id=524901&APPID=1111111111
  ENDPOINT = 'api.openweathermap.org/data/2.5/forecast'
  def initialize(city)
    @uid = city.uid
    @city_name = city.name
    @response = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(fetch_data.body))
    yolo = Rails.logger.info "========== @response class: #{@response.class}"
  end

  # def response
  #   ActiveSupport::HashWithIndifferentAccess.new(@response)
  # end

  def fetch_data
    Rails.logger.info '--- fetching data --------------------'
    RestClient.get ENDPOINT, { params: { id: @uid, 'APPID' => ENV['OPEN_WEATHER_MAP_TOKEN'] } }
    # RestClient.get 'api.openweathermap.org/data/2.5/forecast', {params: {id: 6695624, 'APPID' => ENV['OPEN_WEATHER_MAP_TOKEN']}}
    # api.openweathermap.org/data/2.5/forecast?id=6695624&APPID=17ac356fce697a753b9474155a92c222
  end

  # def temperature
  #   # Kelvin = 0C - 273
  #   @response[:list][]
  # end
end