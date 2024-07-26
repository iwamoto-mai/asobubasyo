json.data do
  json.items do
    json.array!(@spots) do |spot|
      json.id spot.id
      json.user do
        json.name spot.user.name
      end
      json.name spot.name
      json.content spot.content
      json.address spot.address
      json.latitude spot.latitude
      json.longitude spot.longitude
    end  
  end
end