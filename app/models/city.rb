class City < ApplicationRecord
  def self.search(name)
    if name
      Rails.logger.info "========= params: #{name.inspect}"
      Rails.logger.info "========= city: #{find_by(name: name)}"
      city = find_by(name: name)
      # if city
      #   where()
    end
  end
end
