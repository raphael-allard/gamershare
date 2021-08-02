puts "🗑 --- Destroying all records ---"
User.destroy_all

puts "👥 --- Creating users ---"

aelos = User.new(email: "aelos@gmail.com", password: "123456", username: "aelos-74", city: "Paris")
aelos.save!
puts "#{aelos.username} created!"

ragarou = User.new(email: "ragarou@gmail.com", password: "123456", username: "ragarou", city: "Vincennes")
ragarou.save!
puts "#{ragarou.username} created!"

sbooby = User.new(email: "sbooby@gmail.com", password: "123456", username: "Monsieur Sboob", city: "Argenteuil")
sbooby.save!
puts "#{sbooby.username} created!"

puts "👾 --- Creating games ---"

wow_data = IgdbServices::FetchGameData.new(123).call
wow = IgdbServices::NewGame.new(wow_data).call
wow.update!(nostalgia_point: 6, platform: "PC", owner: aelos)
puts "#{wow.name} created!"

joe_mac_data = IgdbServices::FetchGameData.new(12834).call
joe_mac = IgdbServices::NewGame.new(joe_mac_data).call
joe_mac.update!(nostalgia_point: 9, platform: "Super Nintento", owner: aelos)
puts "#{joe_mac.name} created!"

zelda_data = IgdbServices::FetchGameData.new(1026).call
zelda = IgdbServices::NewGame.new(zelda_data).call
zelda.update!(nostalgia_point: 8, platform: "Super Nintento", owner: ragarou)
puts "#{zelda.name} created!"

puts "✅ --- Seed finished ---"
