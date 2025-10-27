# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "auth"

  def after_inactive_sign_in_path_for(resource)
    new_user_confirmation_path
  end
end
