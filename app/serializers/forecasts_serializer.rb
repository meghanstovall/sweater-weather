class ForecastsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :location, :lat, :long, :current, :hourly, :daily, :summary
end
