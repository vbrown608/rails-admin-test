class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_locale

  protected

  def set_locale
    if I18n.available_locales.map(&:to_s).include?(params[:lang])
      I18n.locale = params[:lang]
    end
  end
end
