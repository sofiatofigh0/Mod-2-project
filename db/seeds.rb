# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "uri"
require "net/http"
require 'byebug'

url = URI("https://api.yelp.com/v3/businesses/search?location=New York")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Authorization"] = "Bearer ZzH-C9Kb04Rq0vlnXiu6vx8FgQqsnVVBLGSTRGwSvw_U7BC2f3F5nH9qmLRcdggFwe6XRoTrD_GeIzpHxHzLbo7WGIeixB81dUX4gQJiuBYZbe7ZeKlVjKuKBD_NXnYx"

response = https.request(request)
restaurants_hash = response.read_body
restaurants_hash.map do |business,content|
content.map do |key|
Restaurant.create(name: key[:name], address: key.location[:display_address], phone_number: key.display_phone, yelp_rating: content.rating, price_range: key.price, img_url: key.image_url) 
        end
        end
# response.each do |business|



# response.map do |business|
# business.map do |content|

