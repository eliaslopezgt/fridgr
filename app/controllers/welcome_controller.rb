class WelcomeController < ApplicationController
  caches_action :index, :expires_in => 24.hours
  def index
  end
end
