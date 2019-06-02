module ForecastHelper
  def city_tile(user_city)
    raw("
      <div class='col-md-2 city-link' style='background: #{random_color}'>
        <div class='city-tile-city-name'>
          #{user_city.city.name}
        </div>
      </div>
    ")
  end

  def random_color
    colors = %w[#ff1919 #ff8919 #a492aa #15d315 #2158b4 #ffad19 #3e28bb #ffd019 #6e1eb7 #fff419 #c0139f #c4f518]
    colors.shuffle.pop
  end
end
