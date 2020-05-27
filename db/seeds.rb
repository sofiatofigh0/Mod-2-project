require "uri"
require "net/http"
require 'faker'

url = URI("https://api.yelp.com/v3/businesses/search?location=New York")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Authorization"] = "Bearer ZzH-C9Kb04Rq0vlnXiu6vx8FgQqsnVVBLGSTRGwSvw_U7BC2f3F5nH9qmLRcdggFwe6XRoTrD_GeIzpHxHzLbo7WGIeixB81dUX4gQJiuBYZbe7ZeKlVjKuKBD_NXnYx"

response = https.request(request)

if response.code == "200"
   @info_hash = JSON.parse(response.body)
end

@info_hash["businesses"].uniq.map do |content,values|
   #     content["categories"].uniq.map do |key|
     Restaurant.create(name:content["name"],address:content["location"]["display_address"][0] + "," + content["location"]["display_address"][1],phone_number:content["display_phone"],yelp_rating:content["rating"],price_range:content["price"],img_url:content["image_url"])
 # end
end

76.times do 
        User.create(name: Faker::Name.first_name + " " + Faker::Name.last_name,age: Faker::Number.within(range: 18..80),location: Faker::Address.city)
end

76.times do 
        Bar.create(name: Faker::Coffee.blend_name,address: Faker::Address.street_address + ","+ Faker::Address.zip_code,phone_number: Faker::PhoneNumber.cell_phone)
end


