class ForecastsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :location, :latitude, :longitude, :current, :hourly, :daily, :summary
end
