class City < ApplicationRecord
  def self.search(name)
    if name
      city = find_by(name: name)
    end
  end
end
