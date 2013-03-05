class ApplicationController < ActionController::Base
  protect_from_forgery

  def set_i18n_locale
    locale = extract_locale_from_accept_language_header
    available = ['en', 'es']
    if available.include? locale
      I18n.locale = locale
    end
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
