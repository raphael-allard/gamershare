class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    games_path
  end
end
