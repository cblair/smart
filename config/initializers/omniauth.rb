OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  provider :facebook, '1466986626866086', '2ad6280a3aa9396ed734349aa85cbf7b',
    scope: 'publish_actions'
end