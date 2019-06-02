# frozen_string_literal: true
require 'oj'
require 'benchmark'

desc "load cities to db"
namespace :data do
  task :load_cities => :environment do
    path = Rails.root.join('lib', 'tasks', 'seeds', 'cities.json')
    file = File.read(path)
    data = Oj.load(file)
    cities_count = data.count
    data.each_with_index do |city, index|
      ActiveRecord::Base.transaction do
        City.find_or_create_by(uid: city['id']).tap do |c|
          c.uid = city['id']
          c.name = city['name']
          c.country = city['country']
          c.latitude = city['coord']['lat']
          c.longitude = city['coord']['lon']
          c.save!
          print "\rCities loaded: #{index}/#{cities_count}"
        end
      end
    end
  end
end