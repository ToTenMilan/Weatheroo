class ForecastService
  attr_reader :response, :city_id, :city_uid, :city_name

  def initialize(city)
    @city_id = city.id
    @city_uid = city.uid
    @city_name = city.name
    @response = ActiveSupport::HashWithIndifferentAccess.new(response)
  end

  def response
    {
      "cod": "200",
      "message": 0.0073,
      "cnt": 40,
      "list": [
        {
          "dt": 1559498400,
          "main": {
            "temp": 293.47,
            "temp_min": 293.47,
            "temp_max": 293.724,
            "pressure": 1017.74,
            "sea_level": 1017.74,
            "grnd_level": 1007.75,
            "humidity": 70,
            "temp_kf": -0.25
          },
          "weather": [
            {
              "id": 800,
              "main": "Clear",
              "description": "clear sky",
              "icon": "01d"
            }
          ],
          "clouds": {
            "all": 0
          },
          "wind": {
            "speed": 2.83,
            "deg": 10.049
          },
          "sys": {
            "pod": "d"
          },
          "dt_txt": "2019-06-02 18:00:00"
          },

        ],
        "city": {
          "id": 6695624,
          "name": "Warszawa",
          "coord": {
          "lat": 52.2355,
          "lon": 21.0419
        },
        "country": "PL",
        "timezone": 7200
      }
    }
  end
end