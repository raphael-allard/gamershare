module IgdbServices
  class NewGame
    attr_reader :data
  
    def initialize(data)
      @data = data
    end

    def call
      Game.new(
        name: @data["name"],
        developers: parsing_data(@data["involved_companies"]),
        release_date: converting_unix_to_date(@data["first_release_date"]),
        game_modes: parsing_data(@data["game_modes"]),
        genres: parsing_data(@data["genres"]),
        cover: cover_url_path(@data["cover"]["image_id"])
      )
    end

    def converting_unix_to_date(timestamp)
      Date.strptime(timestamp.to_s, '%s')
    end

    def parsing_data(array)
      array.map { |hash| hash["company"] ? hash["company"]["name"] : hash["name"] }
    end

    def cover_url_path(image_id)
      "https://images.igdb.com/igdb/image/upload/t_cover_big/#{image_id}.jpg"
    end
  end
end
