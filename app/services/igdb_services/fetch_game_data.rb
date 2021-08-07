module IgdbServices
  class FetchGameData
    def initialize(id)
      @id = id
    end

    def call
      uri = URI.parse("https://api.igdb.com/v4/games")
      request = Net::HTTP::Post.new(uri)
      request["Client-Id"] = ENV["IGDB_CLIENT_ID"]
      request["Authorization"] = ENV["IGDB_AUTHORIZATION"]
      request.body = "fields
                        name,
                        first_release_date,
                        game_modes.name,
                        genres.name,
                        involved_companies.company.name,
                        cover.image_id;
                      where id = #{@id};"

      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      JSON.parse(response.body).first
    end
  end
end
