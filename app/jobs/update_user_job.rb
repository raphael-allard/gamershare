class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts ">> updating #{user.username}'s profile..."
    sleep 5
    puts ">> done!"
  end
end
