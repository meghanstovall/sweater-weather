class ForecastsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :location, :latitude, :longitude
end
