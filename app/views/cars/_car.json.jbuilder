json.extract! car, :id, :make, :model, :year, :price, :color, :description, :available, :created_at, :updated_at
json.url car_url(car, format: :json)
