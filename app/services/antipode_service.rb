class AntipodeService

  def self.get_antipode(lat, long)
    get_json("/api/v1/antipodes?lat=#{lat}&long=#{long}")
  end

  private
    def self.get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
      Faraday.new "http://amypode.herokuapp.com" do |conn|
        conn.headers['api_key'] = ENV['AMYPODE_API_KEY']
      end
    end
end
