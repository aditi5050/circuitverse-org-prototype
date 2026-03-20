class ApplicationController < ActionController::Base
<<<<<<< HEAD
  allow_browser versions: :modern
  stale_when_importmap_changes

  before_action :set_current_org

  private

  def set_current_org
    subdomain = request.subdomain

    if subdomain.present?
      @current_org = Organization.find_by(subdomain: subdomain)
    end
  end
end
=======
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
>>>>>>> 1e4ef15e289f6f182fe051153f4d6fb7fa3915d0
