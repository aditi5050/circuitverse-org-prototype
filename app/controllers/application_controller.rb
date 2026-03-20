class ApplicationController < ActionController::Base
  include Pundit::Authorization

  allow_browser versions: :modern
  stale_when_importmap_changes

  before_action :set_current_org
  helper_method :current_org

  rescue_from Pundit::NotAuthorizedError do
    render plain: "Not allowed", status: :forbidden
  end

  private

  def current_org
    @current_org
  end

  def set_current_org
    @current_org = resolve_current_org

    Rails.logger.debug(
      "[TENANT] host=#{request.host.inspect} " \
      "subdomain=#{request.subdomain.inspect} " \
      "subdomains=#{request.subdomains.inspect} " \
      "resolved_subdomain=#{resolved_subdomain.inspect} " \
      "current_org_id=#{@current_org&.id.inspect} " \
      "current_org_subdomain=#{@current_org&.subdomain.inspect} " \
      "current_org_domain=#{@current_org&.domain.inspect}"
    )
  end

  def resolve_current_org
    # 1) Subdomain tenanting (works for iitd.lvh.me even if Rails returns ["iitd","lvh"])
    sd = resolved_subdomain
    if sd.present?
      org = Organization.find_by(subdomain: sd)
      return org if org
    end

    # 2) Custom domain fallback (e.g. iitd.ac.in)
    Organization.find_by(domain: request.host)
  end

  def resolved_subdomain
    # Use request.subdomains (array) rather than request.subdomain (string),
    # then take the first meaningful one.
    ignored = %w[www lvh localhost].to_set
    parts = request.subdomains.reject { |s| ignored.include?(s) }

    parts.first.presence
  end
end