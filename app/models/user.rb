class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :memberships
  has_many :organizations, through: :memberships

  def self.from_omniauth(auth)
    email = auth&.info&.email.to_s.downcase
    return nil if email.empty?

    user = find_or_initialize_by(email: email)
    if user.new_record?
      user.password = Devise.friendly_token[0, 20]
      user.save
    end
    return nil unless user.persisted?

    organization = organization_for_email(email)
    if organization
      Membership.find_or_create_by!(user: user, organization: organization) do |membership|
        membership.role = :student
      end
    end

    user
  end

  def self.organization_for_email(email)
    domain = domain_from_email(email)
    return nil if domain.empty?

    Organization.find_by(domain: domain) || Organization.find_by(subdomain: subdomain_from_domain(domain))
  end
  private_class_method :organization_for_email

  def self.domain_from_email(email)
    email.to_s.split("@").last.to_s
  end
  private_class_method :domain_from_email

  def self.subdomain_from_domain(domain)
    domain.to_s.split(".").first.to_s
  end
  private_class_method :subdomain_from_domain
end