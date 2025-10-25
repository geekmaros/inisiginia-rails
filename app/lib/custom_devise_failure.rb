# frozen_string_literal: true

class CustomDeviseFailure < Devise::FailureApp
  def redirect_url
    if warden_message == :unconfirmed && scope == :user
      flash[:notice] = "Almost there! Please confirm your email before signing in. Check your inbox or enter your email below to resend the confirmation email."
      new_user_confirmation_path
    else
      super
    end
  end
end
