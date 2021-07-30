puts "Destroying all records..."
User.destroy_all

puts "Creating users..."

aelos = User.new(email: "aelos@gmail.com", password: "123456", username: "aelos-74", city: "Paris")
aelos.save!
puts "#{aelos.username} created!"

ragarou = User.new(email: "ragarou@gmail.com", password: "123456", username: "ragarou", city: "Vincennes")
ragarou.save!
puts "#{ragarou.username} created!"

sbooby = User.new(email: "sbooby@gmail.com", password: "123456", username: "Monsieur Sboob", city: "Argenteuil")
sbooby.save!
puts "#{sbooby.username} created!"

puts "Creating games..."

mega_man_x = Game.new
