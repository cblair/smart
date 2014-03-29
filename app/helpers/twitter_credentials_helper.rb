module TwitterCredentialsHelper
    def get_twitter_client
        return Twitter::REST::Client.new do |config|
          config.consumer_key = 'moiKSVMEnrfcWJqoRKrg'
          config.consumer_secret = 'uFawGvrScXhxQZDVkqIV7OJB2Yb7JC7WI17FozXS7c'
          config.access_token = '76392678-2lvqCZ2wV1mooneIYAxgEUyLWSpKxrcHWCgr8MUa8'
          config.access_token_secret = 'V1b3ByyyhUcOocaw5BKaG498E8ziSe1REtE61C6IP8ZzN'
        end
    end
end