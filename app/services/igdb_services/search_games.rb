module IgdbServices
  class SearchGames
    def fetch_games(keyword)
      uri = URI.parse("https://api.igdb.com/v4/search")
      request = Net::HTTP::Post.new(uri)
      request["Client-Id"] = ENV["IGDB_CLIENT_ID"]
      request["Authorization"] = ENV["IGDB_AUTHORIZATION"]
      request.body = "fields *; search \"#{keyword}\"; limit 5;"

      req_options = {
        use_ssl: uri.scheme == "https",
      }
      
      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      JSON.parse(response.body)
    end
  end
end
