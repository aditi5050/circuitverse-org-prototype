class ApplicationController < ActionController::Base
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