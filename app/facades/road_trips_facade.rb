class RoadTripsFacade

  attr_reader :id, :origin, :destination, :travel_time, :arrival_forecast

  # talk to service and create poro to hold onto info from service
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
    @travel_time = trip_duration[:text]
    @arrival_forecast = arrival_forecast
  end

  def trip_duration
    data = GoogleService.get_road_trip(@origin, @destination)
    data[:routes][0][:legs][0][:duration]
  end

  # calls arrival_time method in find enumerable
  def arrival_forecast
    arrival = arrival_time
    arrival_forecast = forecast[:hourly].find {|hour| hour[:dt] == arrival}
    {temp: arrival_forecast[:temp], description: arrival_forecast[:weather][0][:description]}
  end

  # returns the rounded time of arrival in unix
  def arrival_time
    rounded_duration = round_time(trip_duration[:value])
    current_time = round_time(Time.now.to_i)
    current_time + rounded_duration
  end

  def round_time(time)
    round = time - (time % 3600)
    round + 3600
  end

  def forecast
    WeatherService.get_forecast(destination_lat, destination_long)
  end

  def destination_lat
    get_destination_info[:results][0][:geometry][:location][:lat]
  end

  def destination_long
    get_destination_info[:results][0][:geometry][:location][:lng]
  end

  def get_destination_info
    GoogleService.get_coordinates(@destination)
  end
end
