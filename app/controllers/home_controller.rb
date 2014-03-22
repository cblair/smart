class HomeController < ApplicationController
  
  include TwitterCredentialsHelper
  
  # GET /home
  # GET /home.json
  def index
    @twitter_client = get_twitter_client    
  end
end