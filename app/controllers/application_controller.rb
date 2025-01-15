class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def check_admin_prev
    if !current_admin
      redirect_to root_path
    end 
  end 

  def after_sign_in_path_for(resource)
    UserMailer.login_notification(resource).deliver_now
    super(resource)
    root_path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :user_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :user_picture])
  end

  private
  def set_current_cart
    if session[:current_cart_id]
      @current_cart = Cart.find_by_secret_id(session[:current_cart_id])
      if current_user && !@current_cart.user 
        @current_cart.update(user_id: current_user.id)
      end
    else
      if current_user && current_user.carts.any?
        @current_cart = current_user.carts.last
        session[:current_cart_id] = @current_cart.secret_id
      end
    end
  end

end
