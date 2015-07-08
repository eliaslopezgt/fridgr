class CacheController < ApplicationController
  layout false
  before_filter :no_cache
  def no_cache
    response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate' # HTTP 1.1.
    response.headers['Pragma'] = 'no-cache' # HTTP 1.0.
    response.headers['Expires'] = '0' # Proxies.
  end
  def csrf_meta_tags
  end
  def current_session_json
    user_json = {
        :env=>Rails.env
    }
    if session[:flash_notice].present?
      user_json[:flash_notice] = session.delete(:flash_notice)
      session.delete(:flash)
    end
    render :json=>user_json
  end
end