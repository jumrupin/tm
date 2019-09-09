class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_products_path
    when Customer
      root_path
    end
  end

  def after_sign_up_path_for(resource)
    case resource
    when Admin
      admins_products_path
    when Customer
      root_path
    end
  end

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :tell, :birthday, :customer_postal_code, :customer_prefecture, :customer_city, :customer_street_address, :customer_building_name])
  end
end
