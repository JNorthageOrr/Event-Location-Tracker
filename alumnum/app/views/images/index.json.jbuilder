json.array!(@images) do |image|
  json.extract! image, :id, :upload_number
  json.url image_url(image, format: :json)
end
