module TwitterCredentialsHelper
    def get_twitter_client
        return Twitter::REST::Client.new do |config|
          config.consumer_key = 'tm4ROYmQQHwpVBoOZrwYw'
          config.consumer_secret = 'sJPnXnvrGepW5SA6c118KuHm97Xoryv3Te3p6so'
          config.oauth_token = '76392678-wJzqWLYgE1CVxgBEE3hXPAkTotxviLXUJlWizlAwX'
          config.oauth_token_secret = 'f813xamqeqgIb6Z6IXAkaiE1iC10Cg23chwY1nWB1sOrF'
        end
    end
end