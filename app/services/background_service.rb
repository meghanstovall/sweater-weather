class BackgroundService

  def self.get_img_url(location)
    get_json("/search/photos?query=#{location}&client_id=#{ENV['IMG_API_KEY']}")
  end

  private
    def self.get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

    def self.conn
      Faraday.new(url: "https://api.unsplash.com")
    end
end
