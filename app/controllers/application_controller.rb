class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  after_action :verify_authorized,  except: :index, unless: :devise_or_pages_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    # users
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name

    # sellers
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :description_short
    devise_parameter_sanitizer.for(:sign_up) << :description
    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:sign_up) << :address_street
    devise_parameter_sanitizer.for(:sign_up) << :address_zip
    devise_parameter_sanitizer.for(:sign_up) << :address_city
    devise_parameter_sanitizer.for(:sign_up) << :address_country
  end

  def after_sign_in_path_for(resource)
    if resource.class == Seller
      seller_account_sellers_home_path
    elsif resource.admin?
      admin_pages_home_path
    # elsif resource.class == User && params[:redirect_to]
    #   redirect_to (session[params[:redirect_to]])
    else
      home_path
    end
  end

  private

  def devise_or_pages_controller?
    devise_controller? || pages_controller? || self.class.to_s.split("::").first == "Admin"
  end

  def pages_controller?
    controller_name == "pages"  # Brought by the `high_voltage` gem
  end

  def module_admin?
    module_name == "admin"
  end

  def user_not_authorized
    flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end
end
