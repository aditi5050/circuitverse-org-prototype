class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    user = User.from_omniauth(request.env["omniauth.auth"])

    unless user&.persisted?
      return redirect_to new_user_session_path, alert: "Login failed"
    end

    # Avoid sign_in_and_redirect (it can drop subdomain tenant context).
    sign_in user, event: :authentication

    target =
      safe_omniauth_origin ||
      stored_location_for(user) ||
      after_sign_in_path_for(user)

    Rails.logger.debug(
      "[OMNIAUTH] provider=google_oauth2 host=#{request.host.inspect} " \
      "origin=#{request.env['omniauth.origin'].inspect} redirect_target=#{target.inspect}"
    )

    redirect_to target, allow_other_host: true
  end

  def failure
    Rails.logger.debug(
      "[OMNIAUTH] failure host=#{request.host.inspect} origin=#{request.env['omniauth.origin'].inspect}"
    )
    redirect_to new_user_session_path, alert: "Login failed"
  end

  private

  # Redirect back to the page that initiated OAuth (preserves iitd.lvh.me),
  # but only if it's a host we trust.
  def safe_omniauth_origin
    origin = request.env["omniauth.origin"].presence
    return nil unless origin

    uri = URI.parse(origin)
    return nil unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
    return nil if uri.host.blank?

    allowed =
      uri.host == request.host ||
      uri.host == "lvh.me" ||
      uri.host.end_with?(".lvh.me")

    allowed ? origin : nil
  rescue URI::InvalidURIError
    nil
  end
end