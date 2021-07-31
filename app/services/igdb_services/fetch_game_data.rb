module IgdbServices
  class FetchGameData
    def initialize(id)
      @id = id
    end

    def call
      uri = URI.parse("https://api.igdb.com/v4/games")
      request = Net::HTTP::Post.new(uri)
      request["Client-Id"] = "4tj802aytt7uis6le8tmeu4l3hf3b8"
      request["Authorization"] = "Bearer 714uljqwalcj72lsjopmlllrrm4sun"
      request.body = "fields
                        name,
                        platforms.name,
                        first_release_date,
                        game_modes.name,
                        genres.name,
                        involved_companies.company.name;
                      where id = #{@id};"

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
